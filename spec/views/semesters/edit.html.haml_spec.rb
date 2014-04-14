require 'spec_helper'

describe "semesters/edit" do
  before(:each) do
    @semester = assign(:semester, stub_model(Semester,
      :name => "MyString",
      :year => "MyString",
      :semester => 1
    ))
  end

  it "renders the edit semester form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", semester_path(@semester), "post" do
      assert_select "input#semester_name[name=?]", "semester[name]"
      assert_select "input#semester_year[name=?]", "semester[year]"
      assert_select "input#semester_semester[name=?]", "semester[semester]"
    end
  end
end
