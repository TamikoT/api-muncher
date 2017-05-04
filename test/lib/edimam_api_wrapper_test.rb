require "test_helper"

describe 'EdimamApiWrapper' do
  describe "API functionality" do
    it "Can get a list of recipes from the real site" do
      VCR.use_cassette("channels") do
        search = "test search"
        response = EdimamApiWrapper.search("<EDAMAM_ID>", "<EDAMAM_KEY>", search)
        response["ok"].must_equal true
        # response search must equal...
      end
    end

    it "Can get a list of recipes from the fake site" do
      skip
      VCR.use_cassette("channels") do
        response = EdimamApiWrapper.search("invalid search", "test search")
        response["ok"].must_equal false
        response["error"].wont_be_nil
      end
    end
  end
end
