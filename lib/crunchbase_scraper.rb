# this acts as our config.rb file
require 'nokogiri'
require 'pry'
#we'll have to take out the pry require statement when publishing since we only want that dependency for development.


require_relative "./crunchbase_scraper/version"
require_relative "./crunchbase_scraper/cli"
require_relative "./crunchbase_scraper/company"