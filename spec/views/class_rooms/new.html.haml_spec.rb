require 'spec_helper'

describe "class_rooms/new" do
  before(:each) do
    assign(:class_room, stub_model(ClassRoom,
      :teacher => nil,
      :semester => nil,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new class_room form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", class_rooms_path, "post" do
      assert_select "input#class_room_teacher[name=?]", "class_room[teacher]"
      assert_select "input#class_room_semester[name=?]", "class_room[semester]"
      assert_select "input#class_room_name[name=?]", "class_room[name]"
    end
  end
end
