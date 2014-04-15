require 'spec_helper'

describe "semesters/new" do
  before(:each) do
    assign(:semester, stub_model(Semester,
      :name => "MyString",
      :year => "MyString",
      :semester => 1
    ).as_new_record)
  end

  it "renders new semester form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", semesters_path, "post" do
      assert_select "input#semester_name[name=?]", "semester[name]"
      assert_select "input#semester_year[name=?]", "semester[year]"
      assert_select "input#semester_semester[name=?]", "semester[semester]"
    end
  end
end
