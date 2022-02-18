require_relative "USA_Covid_19_Tracker/version"

module USACovid19Tracker
  class Error < StandardError; end
  # Your code goes here...
end


require_relative "USA_Covid_19_Tracker/cli.rb"
require_relative "./country.rb"
require_relative "./state.rb"
require_relative "./scraper.rb"
require_relative "./crud.rb"
require_relative "./users.rb"
