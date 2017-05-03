require 'httparty'
require 'dotenv-rails'

class EdamamApiWrapper
  attr_reader :response

  BASE_URL = "https://api.edamam.com/search\?"
  EDAMAM_ID = ENV["EDAMAM_ID"]
  EDAMAM_KEY = ENV["EDAMAM_KEY"]

  def initialize
  end

  # list of recipes that are returned from a user search
  def self.find_recipes(terms)
    query_params = {
      "q" => terms,
      "id" => EDAMAM_ID,
      "app_key" => EDAMAM_KEY,
      "from" => 0,
      "to" => 5, # first 5 recipes
      "health" => "dairy-free",
    }
    @response = HTTParty.get(BASE_URL, query: query_params).parsed_response
  end
end
