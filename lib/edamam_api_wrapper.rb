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
    hash = recipes_hash(response["hits"])
    return hash
  end

  private

  def self.recipes_hash(hits)
    recipe_collection = Array.new
    hits.each_with_index do |recipe, i|
      recipe_collection[i] = {
        "name" => recipe["recipe"]["label"],
        "url" => recipe["recipe"]["url"],
        "image" => recipe["recipe"]["image"],
        "ingredients" => recipe["recipe"]["ingredientLines"],
      }
    end
    return recipe_collection
  end
end
