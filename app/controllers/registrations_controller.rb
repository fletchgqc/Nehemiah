class RegistrationsController < ApplicationController
  # GET /registrations
  # GET /registrations.xml
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.xml
  def show
    @registration = Registration.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/new
  # GET /registrations/new.xml
  def new
    @registration = Registration.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
    @events = Event.where(:year => params[:year], :season_id => params[:season_id])
  end

  # POST /registrations
  # POST /registrations.xml
  def create
    @registration = Registration.new(params[:registration])

    respond_to do |format|
      if @registration.save
        format.html { redirect_to(@registration, :notice => 'Registration was successfully created.') }
        format.xml  { render :xml => @registration, :status => :created, :location => @registration }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @registration.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /registrations/1
  def update
    @registration = Registration.find(params[:id])

    if @registration.update_attributes(params[:registration])
      unless @registration.event.blank?
        flash[:notice] = 'Registration was successfully updated.'
        redirect_to registrations_eventshow_path(:event_id => @registration.event_id)
      else
        redirect_to :home
      end
    else
      render :action => "edit"
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.xml
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to(registrations_url) }
      format.xml  { head :ok }
    end
  end
  
  def agshow
    set_agshow_vars
    @registrations = Registration.where(:ag_id => @ag.id).
        joins(:event).
        where(:events => {:year => @year, :season_id => @season.id})
    @events = Event.where(:year => @year, :season_id => @season.id)
    @new_registrations = []
    @errors = 0

    blank_lines = @registrations.length == 0 ? 5 : 1
      # new registration for this AG, give them a few vacant lines
    blank_lines.times do
        @new_registrations << Registration.new
    end
  end
  
  def eventshow
    if params[:event_id]
      @event = Event.find(params[:event_id])
      @events = Event.where(:year => @event.year, :season_id => @event.season_id)
    else
      @events = Event.where(:year => params[:year], :season_id => params[:season_id])
      if @events.empty?
        puts 'it was empty'
        flash[:notice] = 'The selected period has no events so far. Please ask the governors to create the events.'
        redirect_to(:controller => 'home') and return
        puts 'it was empty 2'
      end
      @event = @events.first
    end
    @registrations = Registration.where(:event_id => @event.id)
  end

  def agcreate
    @errors = 0
    @new_registrations = []
    for registration_hash in params[:new_registrations] do
      unless (registration_hash[:name].empty?)
        # is not blank line
        registration = Registration.new(registration_hash)
        registration.ag_id = params[:ag_id]
        @new_registrations << registration
        unless registration.valid?
          @errors+=1
        end
      end
    end

    if @errors == 0
      for registration in @new_registrations do
        registration.save!
      end
      flash[:notice] = 'Registration successful.'
      redirect_to(:action => 'agshow', 
        :ag_id => params[:ag_id], :year => params[:year], :season_id => params[:season_id])
    else
      set_agshow_vars
      @registrations = Registration.where(:ag_id => @ag.id).
        joins(:event).
        where(:events => {:year => @year, :season_id => @season.id})
      @events = Event.where(:year => @year, :season_id => @season.id)
      render :action => "agshow"
    end
  end
  
  def set_agshow_vars
    @ag = Ag.find params[:ag_id]
    @year = params[:year]
    @season = Season.find params[:season_id]
  end
  
end
