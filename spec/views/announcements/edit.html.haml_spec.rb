require 'spec_helper'

describe "announcements/edit" do
  before(:each) do
    @announcement = assign(:announcement, stub_model(Announcement,
      :title => "MyString",
      :content => "MyText",
      :teacher => nil
    ))
  end

  it "renders the edit announcement form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", announcement_path(@announcement), "post" do
      assert_select "input#announcement_title[name=?]", "announcement[title]"
      assert_select "textarea#announcement_content[name=?]", "announcement[content]"
      assert_select "input#announcement_teacher[name=?]", "announcement[teacher]"
    end
  end
end
