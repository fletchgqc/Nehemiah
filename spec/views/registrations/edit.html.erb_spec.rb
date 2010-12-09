require 'spec_helper'

describe "registrations/edit.html.erb" do
  before(:each) do
    @registration = assign(:registration, stub_model(Registration,
      :name => "MyString",
      :comments => "MyString",
      :event_id => 1,
      :ag_id => 1
    ))
  end

  it "renders the edit registration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => registration_path(@registration), :method => "post" do
      assert_select "input#registration_name", :name => "registration[name]"
      assert_select "input#registration_comments", :name => "registration[comments]"
      assert_select "input#registration_event_id", :name => "registration[event_id]"
      assert_select "input#registration_ag_id", :name => "registration[ag_id]"
    end
  end
end
