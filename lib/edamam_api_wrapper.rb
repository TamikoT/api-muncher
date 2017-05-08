require 'httparty'
require 'dotenv-rails'

BASE_URL = "https://api.edamam.com/search\?"
EDAMAM_ID = ENV["EDAMAM_ID"]
EDAMAM_KEY = ENV["EDAMAM_KEY"]

class EdamamApiWrapper
  attr_reader :uri, :label, :url, :image, :ingredients, :dietary, :yield, :source, :calories

  def initialize; end

  def self.find_recipes(query)
    query_params = {
      "q" => query,
      "id" => EDAMAM_ID,
      "app_key" => EDAMAM_KEY,
      "from" => 0,
      "to" => 5, # first 5 recipes
      "health" => "dairy-free",
    }
    response = HTTParty.get(BASE_URL, query: query_params).parsed_response
    recipe_collection = Array.new
    response["hits"].each do |recipe|
      recipe_collection << Recipe.new(recipe)
    end
    return recipe_collection
  end

  def self.find(uri)
    query_params = {
      "q" => terms,
      "id" => EDAMAM_ID,
      "app_key" => EDAMAM_KEY,
      "r" => recipe["uri"],
    }
    response = HTTParty.get(BASE_URL, query: query_params)
    found_recipe = Recipe.new(response["hits"])
    return found_recipe
  end
end
