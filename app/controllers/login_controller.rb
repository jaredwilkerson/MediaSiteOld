class LoginController < ApplicationController
  #layout "login"
  
  # GET /movies
  # GET /movies.xml
  def index
    @movies = Movie.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @movies }
    end
  end
  
  def create
  #  if user = User.authenticate(params[:username, params[:password])
      # Save the user ID in the session so it can be used in subsequent requests
      session[:current_user_id] = user.id
      redirect_to root_url
  #  end
  end

  def destroy
     # Remove the user id from the session
    session[:current_user_id] = nil
    redirect_to root_url
  end
end
