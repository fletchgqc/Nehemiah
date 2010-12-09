require 'spec_helper'

describe "registrations/show.html.erb" do
  before(:each) do
    @registration = assign(:registration, stub_model(Registration,
      :name => "Name",
      :comments => "Comments",
      :event_id => 1,
      :ag_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Comments/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
