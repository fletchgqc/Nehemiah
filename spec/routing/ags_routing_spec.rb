require "spec_helper"

describe AgsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/ags" }.should route_to(:controller => "ags", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/ags/new" }.should route_to(:controller => "ags", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/ags/1" }.should route_to(:controller => "ags", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/ags/1/edit" }.should route_to(:controller => "ags", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/ags" }.should route_to(:controller => "ags", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/ags/1" }.should route_to(:controller => "ags", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/ags/1" }.should route_to(:controller => "ags", :action => "destroy", :id => "1")
    end

  end
end
