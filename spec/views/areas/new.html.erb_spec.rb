require 'spec_helper'

describe "areas/new.html.erb" do
  before(:each) do
    assign(:area, stub_model(Area,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new area form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => areas_path, :method => "post" do
      assert_select "input#area_name", :name => "area[name]"
    end
  end
end
