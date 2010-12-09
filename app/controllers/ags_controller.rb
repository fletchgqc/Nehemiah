class AgsController < ApplicationController
  # GET /ags
  # GET /ags.xml
  def index
    @ags = Ag.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ags }
    end
  end

  # GET /ags/1
  # GET /ags/1.xml
  def show
    @ag = Ag.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ag }
    end
  end

  # GET /ags/new
  # GET /ags/new.xml
  def new
    @ag = Ag.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ag }
    end
  end

  # GET /ags/1/edit
  def edit
    @ag = Ag.find(params[:id])
  end

  # POST /ags
  # POST /ags.xml
  def create
    @ag = Ag.new(params[:ag])

    respond_to do |format|
      if @ag.save
        format.html { redirect_to(@ag, :notice => 'Ag was successfully created.') }
        format.xml  { render :xml => @ag, :status => :created, :location => @ag }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ags/1
  # PUT /ags/1.xml
  def update
    @ag = Ag.find(params[:id])

    respond_to do |format|
      if @ag.update_attributes(params[:ag])
        format.html { redirect_to(@ag, :notice => 'Ag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ag.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ags/1
  # DELETE /ags/1.xml
  def destroy
    @ag = Ag.find(params[:id])
    @ag.destroy

    respond_to do |format|
      format.html { redirect_to(ags_url) }
      format.xml  { head :ok }
    end
  end
end
