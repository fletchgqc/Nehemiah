require 'spec_helper'

describe SeasonsController do

  def mock_season(stubs={})
    (@mock_season ||= mock_model(Season).as_null_object).tap do |season|
      season.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all seasons as @seasons" do
      Season.stub(:all) { [mock_season] }
      get :index
      assigns(:seasons).should eq([mock_season])
    end
  end

  describe "GET show" do
    it "assigns the requested season as @season" do
      Season.stub(:find).with("37") { mock_season }
      get :show, :id => "37"
      assigns(:season).should be(mock_season)
    end
  end

  describe "GET new" do
    it "assigns a new season as @season" do
      Season.stub(:new) { mock_season }
      get :new
      assigns(:season).should be(mock_season)
    end
  end

  describe "GET edit" do
    it "assigns the requested season as @season" do
      Season.stub(:find).with("37") { mock_season }
      get :edit, :id => "37"
      assigns(:season).should be(mock_season)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created season as @season" do
        Season.stub(:new).with({'these' => 'params'}) { mock_season(:save => true) }
        post :create, :season => {'these' => 'params'}
        assigns(:season).should be(mock_season)
      end

      it "redirects to the created season" do
        Season.stub(:new) { mock_season(:save => true) }
        post :create, :season => {}
        response.should redirect_to(season_url(mock_season))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved season as @season" do
        Season.stub(:new).with({'these' => 'params'}) { mock_season(:save => false) }
        post :create, :season => {'these' => 'params'}
        assigns(:season).should be(mock_season)
      end

      it "re-renders the 'new' template" do
        Season.stub(:new) { mock_season(:save => false) }
        post :create, :season => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested season" do
        Season.should_receive(:find).with("37") { mock_season }
        mock_season.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :season => {'these' => 'params'}
      end

      it "assigns the requested season as @season" do
        Season.stub(:find) { mock_season(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:season).should be(mock_season)
      end

      it "redirects to the season" do
        Season.stub(:find) { mock_season(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(season_url(mock_season))
      end
    end

    describe "with invalid params" do
      it "assigns the season as @season" do
        Season.stub(:find) { mock_season(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:season).should be(mock_season)
      end

      it "re-renders the 'edit' template" do
        Season.stub(:find) { mock_season(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested season" do
      Season.should_receive(:find).with("37") { mock_season }
      mock_season.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the seasons list" do
      Season.stub(:find) { mock_season }
      delete :destroy, :id => "1"
      response.should redirect_to(seasons_url)
    end
  end

end
