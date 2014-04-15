require 'spec_helper'

describe "class_rooms/index" do
  before(:each) do
    assign(:class_rooms, [
      stub_model(ClassRoom,
        :teacher => nil,
        :semester => nil,
        :name => "Name"
      ),
      stub_model(ClassRoom,
        :teacher => nil,
        :semester => nil,
        :name => "Name"
      )
    ])
  end

  it "renders a list of class_rooms" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
