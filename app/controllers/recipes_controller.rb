class RecipesController
# < ApplicationController
  require 'httparty'
  require 'dotenv/load'
  require 'awesome_print'

  BASE_URL = "https://api.edamam.com/search\?"
  EDAMAM_ID = ENV["EDAMAM_ID"]
  EDAMAM_KEY = ENV["EDAMAM_KEY"]

  def index
  end

  # list of recipes that are returned from a user
  def self.search(terms)
    query_params = {
      "q" => terms,
      "id" => EDAMAM_ID,
      "app_key" => EDAMAM_KEY,
      "from" => 0,
      "to" => 0, # first recipe
      "health" => "dairy-free",
    }
    results = HTTParty.get(BASE_URL, query: query_params)
    return results["hits"]
  end
end

a = RecipesController.search("beets")
ap a
