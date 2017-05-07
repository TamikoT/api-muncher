require 'httparty'
require 'dotenv-rails'

BASE_URL = "https://api.edamam.com/search\?"
EDAMAM_ID = ENV["EDAMAM_ID"]
EDAMAM_KEY = ENV["EDAMAM_KEY"]

class EdamamApiWrapper

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
    response = HTTParty.get(BASE_URL, query: query_params)
    recipe_collection = recipes_hash(response["hits"])
    return recipe_collection
  end

  def self.find(recipe)
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

  private

  def self.recipes_hash(hits)
    recipe_collection = []
    hits.each do |recipe|
      recipe_collection << Recipe.new(recipe)
    end
    return recipe_collection
  end
end
