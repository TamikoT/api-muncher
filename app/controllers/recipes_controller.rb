class RecipesController < ApplicationController

  def index; end

  def search
    @recipes = EdamamApiWrapper.find_recipes(params[:q])
  end

  def show
    @recipe = EdamamApiWrapper.find(params[:index])
  end
end
