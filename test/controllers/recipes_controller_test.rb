require "test_helper"

describe RecipesController do
  it "should get search" do
    get search_path
    value(response).must_be :success?
  end
end
