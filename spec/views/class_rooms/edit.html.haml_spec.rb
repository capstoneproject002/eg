require 'spec_helper'

describe "class_rooms/edit" do
  before(:each) do
    @class_room = assign(:class_room, stub_model(ClassRoom,
      :teacher => nil,
      :semester => nil,
      :name => "MyString"
    ))
  end

  it "renders the edit class_room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", class_room_path(@class_room), "post" do
      assert_select "input#class_room_teacher[name=?]", "class_room[teacher]"
      assert_select "input#class_room_semester[name=?]", "class_room[semester]"
      assert_select "input#class_room_name[name=?]", "class_room[name]"
    end
  end
end
