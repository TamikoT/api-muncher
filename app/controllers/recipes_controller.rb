require 'edamam_api_wrapper'

class RecipesController < ApplicationController
  def index
    # @recipes = EdamamApiWrapper.random
  end

  def search
    @recipes = EdamamApiWrapper.find_recipes(params[:q])
  end
end
