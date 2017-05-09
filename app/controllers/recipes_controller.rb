class RecipesController < ApplicationController

  def home
  end

  def index
    @recipes = paginate(EdamamApiWrapper.find_recipes(params[:q]), params[:page])
  end

  def show
    @recipe = EdamamApiWrapper.find(params[:index])
  end

  private

  def paginate(recipes, page_num)
    raise
    Kaminari.paginate_array(recipes).page(page_num).per(10)
  end
end
