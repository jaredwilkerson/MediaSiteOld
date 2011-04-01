class SongsController < ApplicationController
  layout "main"
  
  # GET /songs
  # GET /songs.xml
  def index
    @songs = Song.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @songs }
    end
  end

  # GET /songs/1
  # GET /songs/1.xml
  def show
    @song = Song.where(:id => params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @song }
    end
  end

  # GET /songs/new
  # GET /songs/new.xml
  def new
    @song = Song.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @song }
    end
  end

  # GET /songs/1/edit
  def edit
    @song = Song.where(:id => params[:id])
  end

  # POST /songs
  # POST /songs.xml
  def create
    @song = Song.new(params[:song])

    respond_to do |format|
      if @song.save
        flash[:notice] = 'Song was successfully created.'
        format.html { redirect_to(@song) }
        format.xml  { render :xml => @song, :status => :created, :location => @song }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /songs/1
  # PUT /songs/1.xml
  def update
    @song = Song.where(:id => params[:id])

    respond_to do |format|
      if @song.update_attributes(params[:song])
        flash[:notice] = 'Song was successfully updated.'
        format.html { redirect_to(@song) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @song.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.xml
  def destroy
    @song = Song.find(params[:id])
    @song.destroy

    respond_to do |format|
      format.html { redirect_to(songs_url) }
      format.xml  { head :ok }
    end
  end

  def update_list
    @output = " "
    params[:song_names].each do |name|
      @output+= name
    end

    @names = params[:song_names]
    @songs = Array.new
    @names.each do |name|
      @songs << Song.where(:title => name)
    end

    respond_to do |format|

      if ('edit' == params[:submit]) && (false == @songs.empty?)
        #format.html{ render "maintenance/index"}#, :movie_names => params[:movie_names]}
        format.html{ render "edit", :songs => @songs, :layout => 'maintenance'}
         flash[:notice] = @output;
      elsif ('delete' == params[:submit]) && (false == @songs.empty?)
        #destroy
         Song.destroy(@songs)
         format.html { render 'maintenance/index', :layout => 'maintenance' }
      else
        flash[:notice] = 'Incorrect method submitted'
        format.html { render 'maintenance/index', :layout => 'maintenance' }
      end
    end
  end
end
