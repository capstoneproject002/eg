require 'spec_helper'

describe "announcements/new" do
  before(:each) do
    assign(:announcement, stub_model(Announcement,
      :title => "MyString",
      :content => "MyText",
      :teacher => nil
    ).as_new_record)
  end

  it "renders new announcement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", announcements_path, "post" do
      assert_select "input#announcement_title[name=?]", "announcement[title]"
      assert_select "textarea#announcement_content[name=?]", "announcement[content]"
      assert_select "input#announcement_teacher[name=?]", "announcement[teacher]"
    end
  end
end
