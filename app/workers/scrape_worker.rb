#noinspection RubyClassVariableUsageInspection
class ScrapeWorker
  include Sidekiq::Worker

  require 'mechanize'


  # @param [Integer] id
  def perform(id)
    agent = Mechanize.new { |agent|
      agent.user_agent_alias = 'Windows Mozilla'
    }

    agent.get('http://www.saltybet.com') do |root_page|
      login_page = agent.click(root_page.link_with(:href => '../authenticate?signin=1'))

      logged_in = login_page.form_with(:id => 'signinform') { |login_form|
        login_form.email = ENV['SALTY_USER'] || 'PutYourEmailHereBuddy'
        login_form.pword = ENV['SALTY_PASS'] || 'AndAPasswordToo'
      }.click_button

      if logged_in.filename[0, 4] == 'auth'
        logger.fatal 'Failed to login'
        exit(-1)
      else
        logger.info 'Successfully logged in'
      end
    end

    agent.get('http://www.saltybet.com/stats?tournament_id='+id) do |tourneypage|
      get_tournament_entries(tourneypage)
    end
  end

  private
  # @param [Mechanize::Page] tourneypage
  def get_tournament_entries(tourneypage)
    logger.info('Scraping ' + tourneypage.uri.to_s)
    skip_count = 0
    tourneypage.search('//table/tbody/tr').each do |entry|
      unless parse_entry(entry)
        skip_count += 1
      end
    end
    links_with = tourneypage.links_with(:text => 'Next')
    if skip_count==0
      if links_with.length>0
        get_tournament_entries(links_with[0].click)
      end
    else
      logger.info("Skipped #{skip_count} matches, we've already scraped!")
    end

  end

  # @param [Nokogiri::XML::Node] element
  def parse_entry(element)
    begin
      matchup  = element.children[0].children[0]
      match_id = matchup.attr('href').gsub(/[^0-9]+/, '')

      # First check if we have an extant match entry for this particular fight.
      if Fight.find_by_match_id(match_id)
        return false
      else
        bet_count    = element.children[8].text
        winner_color = element.children[2].children[0].attr('class')
        red_name     = matchup.children[0].text
        blue_name    = matchup.children[2].text
        red_value    = matchup.children[1].text.gsub(/[^0-9]+/, '')
        blue_value   = matchup.children[3].text.gsub(/[^0-9]+/, '')
        red_champ    = Champion.find_or_create_by(name: red_name.downcase.strip)
        blue_champ   = Champion.find_or_create_by(name: blue_name.downcase.strip)

        fight_entry               = Fight.new(bet_count: bet_count, bets_red: red_value, bets_blue: blue_value, match_id: match_id)
        fight_entry.blue_champion = blue_champ
        fight_entry.red_champion  = red_champ

        if winner_color == 'bluetext'
          fight_entry.winner = 2
        else
          fight_entry.winner = 1
        end

        fight_entry.update_champions
        fight_entry.save
        return true
      end
    rescue => error
      logger.warn(error)
    end

  end

end