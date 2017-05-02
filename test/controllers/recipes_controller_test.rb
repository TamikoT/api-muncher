require "test_helper"

describe RecipesController do
  it "should get index" do
    get recipes_index_url
    value(response).must_be :success?
  end

  describe "API functionality" do
    it "Can get a list of recipes from the real site" do
      skip
      VCR.use_cassette("channels") do
        search = "test search"
        response = RecipesController.search("<EDAMAM_ID>", search)
        response["ok"].must_equal true
        # response search must equal...
      end
    end

    it "Can get a list of recipes from the fake site" do
      skip
      VCR.use_cassette("channels") do
        response = RecipesController.search("invalid search", "test search")
        response["ok"].must_equal false
        response["error"].wont_be_nil
      end
    end
  end
end
