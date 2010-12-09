require 'spec_helper'

describe "events/edit.html.erb" do
  before(:each) do
    @event = assign(:event, stub_model(Event,
      :location => "MyString",
      :year => 1,
      :season_id => 1
    ))
  end

  it "renders the edit event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => event_path(@event), :method => "post" do
      assert_select "input#event_location", :name => "event[location]"
      assert_select "input#event_year", :name => "event[year]"
      assert_select "input#event_season_id", :name => "event[season_id]"
    end
  end
end
