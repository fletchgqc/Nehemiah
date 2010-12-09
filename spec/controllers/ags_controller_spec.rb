require 'spec_helper'

describe AgsController do

  def mock_ag(stubs={})
    (@mock_ag ||= mock_model(Ag).as_null_object).tap do |ag|
      ag.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all ags as @ags" do
      Ag.stub(:all) { [mock_ag] }
      get :index
      assigns(:ags).should eq([mock_ag])
    end
  end

  describe "GET show" do
    it "assigns the requested ag as @ag" do
      Ag.stub(:find).with("37") { mock_ag }
      get :show, :id => "37"
      assigns(:ag).should be(mock_ag)
    end
  end

  describe "GET new" do
    it "assigns a new ag as @ag" do
      Ag.stub(:new) { mock_ag }
      get :new
      assigns(:ag).should be(mock_ag)
    end
  end

  describe "GET edit" do
    it "assigns the requested ag as @ag" do
      Ag.stub(:find).with("37") { mock_ag }
      get :edit, :id => "37"
      assigns(:ag).should be(mock_ag)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created ag as @ag" do
        Ag.stub(:new).with({'these' => 'params'}) { mock_ag(:save => true) }
        post :create, :ag => {'these' => 'params'}
        assigns(:ag).should be(mock_ag)
      end

      it "redirects to the created ag" do
        Ag.stub(:new) { mock_ag(:save => true) }
        post :create, :ag => {}
        response.should redirect_to(ag_url(mock_ag))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved ag as @ag" do
        Ag.stub(:new).with({'these' => 'params'}) { mock_ag(:save => false) }
        post :create, :ag => {'these' => 'params'}
        assigns(:ag).should be(mock_ag)
      end

      it "re-renders the 'new' template" do
        Ag.stub(:new) { mock_ag(:save => false) }
        post :create, :ag => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested ag" do
        Ag.should_receive(:find).with("37") { mock_ag }
        mock_ag.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :ag => {'these' => 'params'}
      end

      it "assigns the requested ag as @ag" do
        Ag.stub(:find) { mock_ag(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:ag).should be(mock_ag)
      end

      it "redirects to the ag" do
        Ag.stub(:find) { mock_ag(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(ag_url(mock_ag))
      end
    end

    describe "with invalid params" do
      it "assigns the ag as @ag" do
        Ag.stub(:find) { mock_ag(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:ag).should be(mock_ag)
      end

      it "re-renders the 'edit' template" do
        Ag.stub(:find) { mock_ag(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested ag" do
      Ag.should_receive(:find).with("37") { mock_ag }
      mock_ag.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the ags list" do
      Ag.stub(:find) { mock_ag }
      delete :destroy, :id => "1"
      response.should redirect_to(ags_url)
    end
  end

end
