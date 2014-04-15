require 'spec_helper'

describe "class_rooms/show" do
  before(:each) do
    @class_room = assign(:class_room, stub_model(ClassRoom,
      :teacher => nil,
      :semester => nil,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/Name/)
  end
end
