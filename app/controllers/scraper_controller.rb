#noinspection RubyClassVariableUsageInspection
class ScraperController < ApplicationController
  require 'rubygems'
  require 'mechanize'

  # Class variables are dirty as heck (They equate to static in my world) but ostensibly there's only one call into the scraper
  # Since it's ultimately getting gated behind a login process.
  @@scraper_logged_in = false

  @@agent = Mechanize.new { | agent |
    agent.user_agent_alias = 'Windows Mozilla'
  }

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
    entries = Array.new
    tourneypage.search('//table/tbody/tr').each do |entry|
      entries.push(parse_entry(entry))
    end
  end

  #Takes a Nokogiri::XML::Element
  #Wherein we pick apart the entries.
  def parse_entry(element)
    matchup = element.children[0]
    winner = element.children[2]
    print('hi')
  end
end
