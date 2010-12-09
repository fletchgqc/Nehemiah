require 'spec_helper'

describe "ags/new.html.erb" do
  before(:each) do
    assign(:ag, stub_model(Ag,
      :name => "MyString",
      :area_id => 1
    ).as_new_record)
  end

  it "renders new ag form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => ags_path, :method => "post" do
      assert_select "input#ag_name", :name => "ag[name]"
      assert_select "input#ag_area_id", :name => "ag[area_id]"
    end
  end
end
