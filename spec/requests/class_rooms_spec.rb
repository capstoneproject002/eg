require 'spec_helper'

describe "ClassRooms" do
  describe "GET /class_rooms" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get class_rooms_path
      response.status.should be(200)
    end
  end
end
