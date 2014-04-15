require 'spec_helper'

describe "attachments/edit" do
  before(:each) do
    @attachment = assign(:attachment, stub_model(Attachment,
      :user => nil,
      :class_room => nil,
      :title => "MyString"
    ))
  end

  it "renders the edit attachment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", attachment_path(@attachment), "post" do
      assert_select "input#attachment_user[name=?]", "attachment[user]"
      assert_select "input#attachment_class_room[name=?]", "attachment[class_room]"
      assert_select "input#attachment_title[name=?]", "attachment[title]"
    end
  end
end
