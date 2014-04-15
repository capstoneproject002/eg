require 'spec_helper'

describe "attachments/new" do
  before(:each) do
    assign(:attachment, stub_model(Attachment,
      :user => nil,
      :class_room => nil,
      :title => "MyString"
    ).as_new_record)
  end

  it "renders new attachment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attachments_path, "post" do
      assert_select "input#attachment_user[name=?]", "attachment[user]"
      assert_select "input#attachment_class_room[name=?]", "attachment[class_room]"
      assert_select "input#attachment_title[name=?]", "attachment[title]"
    end
  end
end
