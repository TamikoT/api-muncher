class Recipe
  attr_reader :uri, :label, :url, :image, :ingredients, :dietary

  def initialize(recipe)
    recipe["recipe"]["uri"] = {
      "label" => recipe["recipe"]["label"],
      "url" => recipe["recipe"]["shareAs"],
      "image" => recipe["recipe"]["image"],
      "ingredients" => recipe["recipe"]["ingredientLines"],
      "dietary" => recipe["recipe"]["healthLabels"],
      "yield" => recipe["recipe"]["yield"],
      "source" => recipe["recipe"]["source"],
      "calories" => recipe["recipe"]["calories"].to_i,
    }
  end
end
