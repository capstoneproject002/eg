require 'spec_helper'

describe "semesters/show" do
  before(:each) do
    @semester = assign(:semester, stub_model(Semester,
      :name => "Name",
      :year => "Year",
      :semester => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Year/)
    rendered.should match(/1/)
  end
end
