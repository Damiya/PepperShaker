Apipie.configure do |config|
  config.app_name                = 'PepperShaker'
  config.validate                = false
  config.markup                  = Apipie::Markup::Markdown.new
  config.api_base_url            = '/api'
  config.doc_base_url            = '/apipie'
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
  config.app_info                = 'PepperShaker is a site that automatically scrapes matches from [SaltyBet.com](http://saltybet.com) and exposes the results via an API.'
end
