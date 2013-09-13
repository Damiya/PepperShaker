#noinspection RubyClassVariableUsageInspection
class ScraperController < ApplicationController
  require 'rubygems'
  require 'mechanize'

  @@agent             = Mechanize.new { |agent|
    agent.user_agent_alias = 'Windows Mozilla'
  }
  @@scraper_logged_in = false

  def scrape
    unless @@scraper_logged_in
      @@agent.get('http://www.saltybet.com') do |root_page|
        login_page = @@agent.click(root_page.link_with(:href => '../authenticate?signin=1'))

        logged_in = login_page.form_with(:id => 'signinform') { |login_form|
          login_form.email = ENV['SALTY_USER'] || 'PutYourEmailHereBuddy'
          login_form.pword = ENV['SALTY_PASS'] || 'AndAPasswordToo'
        }.click_button

        if logged_in.filename[0, 4] == 'auth'
          @@scraper_logged_in = false
          logger.fatal 'Failed to login'
          exit(-1)
        else
          logger.info 'Successfully logged in'
          @@scraper_logged_in = true
        end
      end
    end

    if @@scraper_logged_in
      @@agent.get('http://www.saltybet.com/stats?tournament_id='+params[:id]) do |tourneypage|
        get_tournament_entries(tourneypage)
      end
    end
  end

  private

  #Takes a Mechanize::Page
  def get_tournament_entries(tourneypage)
    logger.info('Scraping ' + tourneypage.uri.to_s)
    tourneypage.search('//table/tbody/tr').each do |entry|
      parse_entry(entry)
    end
    links_with = tourneypage.links_with(:text => 'Next')
    if links_with.length>0
      get_tournament_entries(links_with[0].click)
    end

  end

  #Takes a Nokogiri::XML::Element
  #Wherein we pick apart the entries.
  def parse_entry(element)
    begin
      matchup      = element.children[0].children[0]
      bet_count    = element.children[8].text
      winner_color = element.children[2].children[0].attr('class')
      red_name     = matchup.children[0].text
      blue_name    = matchup.children[2].text
      red_value    = matchup.children[1].text.gsub(/[^0-9]/, '')
      blue_value   = matchup.children[3].text.gsub(/[^0-9]/, '')
      red_champ    = Champion.find_or_create_by(name: red_name)
      blue_champ   = Champion.find_or_create_by(name: blue_name)

      fight_entry = Fight.new(bet_count: bet_count, bets_red: red_value, bets_blue: blue_value)

      fight_entry.blue_champion_id=blue_champ.id
      fight_entry.red_champion_id =red_champ.id

      if winner_color == 'bluetext'
        fight_entry.winner = 2
      else
        fight_entry.winner = 1
      end

      fight_entry.update_champions
      fight_entry.save
    rescue
      logger.warn('Failed to process the element: ' + element)
    end

  end
end
