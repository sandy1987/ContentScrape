require "rails_helper"

RSpec.describe Api::V1::ContentsController, :type => :controller do

  describe "Creating and Showing ContentTag and URL With Content" do
    
  	it "Creating the Content" do 
	  		content_tag = "<h1>This is My Facebook URL<a href='www.facebook.com'>Facebook</a></h1><h2>This is My Twitter URL <a href='https://twitter.com/'>Twitter</a></h2><h3>This is My Instagram URL<a href='https://www.instagram.com/'>Instagram</a></h3>"
	  		content = Content.html_tags_content(content_tag)
	  		expect(content.first.children.text).to eq("This is My Facebook URLFacebook")
  	end

    it "Show all Content and URL of ContentTags" do
	     get :index
	     expect(response).to be_success
    end
  end
end