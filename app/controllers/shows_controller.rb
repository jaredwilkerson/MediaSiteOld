class ShowsController < ApplicationController
  layout "main"

  # GET /shows
  # GET /shows.xml
  def index
    @shows = Show.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shows }
    end
  end

  # GET /shows/1
  # GET /shows/1.xml
  def show
    @show = Show.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @show }
    end
  end

  # GET /shows/new
  # GET /shows/new.xml
  def new
    @show = Show.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @show }
    end
  end

  # GET /shows/1/edit
  def edit
    @show = Show.find(params[:id])
  end

  # POST /shows
  # POST /shows.xml
  def create
    @show = Show.new(params[:show])

    respond_to do |format|
      if @show.save
        flash[:notice] = 'Show was successfully created.'
        format.html { redirect_to(@show) }
        format.xml  { render :xml => @show, :status => :created, :location => @show }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /shows/1
  # PUT /shows/1.xml
  def update
    @show = Show.find(params[:id])

    respond_to do |format|
      if @show.update_attributes(params[:show])
        flash[:notice] = 'Show was successfully updated.'
        format.html { redirect_to(@show) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @show.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /shows/1
  # DELETE /shows/1.xml
  def destroy
    @shows.each do |show|
      #@show = Show.find(params[:id])
      @show.destroy
    end
    @show = Show.find(params[:id])
    @show.destroy

    respond_to do |format|
      format.html { redirect_to(shows_url) }
      format.xml  { head :ok }
    end
  end

  def update_list
    @output = " "

    @shows = Array.new
    if params[:show_names]
      params[:show_names].each do |name|
        @output+= name
      end   

      @names = params[:show_names]
      
      @names.each do |name|
        @shows << Show.find(:all, :conditions => { :title => name })
      end
    end

    respond_to do |format|

      if ('edit' == params[:submit]) && (false == @shows.empty?)
        #format.html{ render "maintenance/index"}#, :movie_names => params[:movie_names]}
        format.html{ render "edit", :shows => @shows, :layout => 'maintenance'}
         flash[:notice] = @output;
      elsif ('delete' == params[:submit]) && (false == @shows.empty?)
        #destroy
         Show.destroy(@shows)
         format.html { render 'maintenance/index', :layout => 'maintenance' }
      else
        flash[:notice] = 'Incorrect method submitted'
        format.html { render 'maintenance/index', :layout => 'maintenance' }
      end
    end
  end

end
