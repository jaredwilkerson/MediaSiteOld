class MoviesController < ApplicationController
  layout "main"

  # GET /movies
  # GET /movies.xml
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movies }
    end
  end

  # GET /movies/1
  # GET /movies/1.xml
  def show
    @movie = Movie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @movie }
    end
  end

  # GET /movies/new
  # GET /movies/new.xml
  def new
    @movie = Movie.new

    respond_to do |format|
      format.html # new.html.erb
      #format.js
      format.xml  { render :xml => @movie }
    end
  end

  # GET /movies/1/edit

  #def edit

  #  respond_to do |format|
  #    format.html # edit.html.erb
  #    format.xml  { render :xml => @movie }
  #  end

  #end


  # POST /movies
  # POST /movies.xml
  def create
    @movie = Movie.new(params[:movie])

    respond_to do |format|
      if @movie.save
        flash[:notice] = 'Movie was successfully created.'
        format.html { render 'maintenance/index', :layout => 'maintenance' }
        #format.js
        format.xml  { render :xml => @movie, :status => :created, :location => @movie }
      else
        format.html { render 'maintenance/index', :layout => 'maintenance' }
        #format.js
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /movies/1
  # PUT /movies/1.xml
  def update
    @movie = Movie.find(params[:id])

    respond_to do |format|
      @movie.reload
      if @movie.update_attributes(params[:movie])
        flash[:notice] = 'Movie was successfully updated.'
        format.html { render 'maintenance/index', :layout => 'maintenance' }
        format.js
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.js
        format.xml  { render :xml => @movie.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.xml
  def destroy
    @movies.each do |movie|
    #@movie = Movie.find(params[:id])
      movie.destroy
    end

   # respond_to do |format|
      
   #   format.xml  { head :ok }
   # end
  end

  def update_list
    @output = " "
    params[:movie_names].each do |name|
      @output+= name
    end

    @names = params[:movie_names]
    @movies = Array.new
    @names.each do |name|
      @movies << Movie.find(:all, :conditions => { :title => name })
    end

    respond_to do |format|
     
      if ('edit' == params[:submit]) && (false == @movies.empty?)
        #format.html{ render "maintenance/index"}#, :movie_names => params[:movie_names]}
        format.html{ render "edit", :movies => @movies, :layout => 'maintenance'}
         flash[:notice] = @output;
      elsif ('delete' == params[:submit]) && (false == @movies.empty?)
        #destroy
         Movie.destroy(@movies)
         format.html { render 'maintenance/index', :layout => 'maintenance' }
      else
        flash[:notice] = 'Incorrect method submitted'
        format.html { render 'maintenance/index', :layout => 'maintenance' }
      end
    end
  end
  
end
