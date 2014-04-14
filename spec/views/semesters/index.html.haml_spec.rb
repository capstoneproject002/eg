require 'spec_helper'

describe "semesters/index" do
  before(:each) do
    assign(:semesters, [
      stub_model(Semester,
        :name => "Name",
        :year => "Year",
        :semester => 1
      ),
      stub_model(Semester,
        :name => "Name",
        :year => "Year",
        :semester => 1
      )
    ])
  end

  it "renders a list of semesters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Year".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
