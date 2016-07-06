class UsersController < ApplicationController
  #displays login/reg splash page
  #automatically looks for index.html.erb in views/users
  def index
  end

  #creates User into DB
  def create
  	#@user creates variable of a new User, filled in by user_params
  	@user = User.new( user_params )
  	if @user.save #if @user is successfully created (passes validations)
  	  session[:id] = @user.id #sets session[:id] as the ID
  	  redirect_to '/dashboard' #once created, takes to user dashboard
  	else
  	  flash[:errors] = @user.errors.full_messages #prints validation errors
  	  redirect_to :back #takes user back to refreshed index page
  	end
  end

  #displays user dashboard after reg/login
  #automatically looks for dashboard.html.erb
  def dashboard
  	#can now use @user as variable to reference logged in user
  	@user = User.find(current_user.id)
  	@note = User.find(current_user.id).notes
  end

  #logins in user
  def login
  	#creates variable 'user' which holds data found by email input
  	user = User.find_by_email(params[:email])
  	if user && user.authenticate(params[:password])
  	  session[:id] = user.id
  	  redirect_to '/dashboard'
  	else
  	  flash[:errors] = ["Email & Password Did Not Match Records!"]
  	  redirect_to :back #takes back to refreshed reg/login page
  	end
  end

  #logouts user
  def logout
  	session[:id] = nil #destroys session ID
  	redirect_to action: "index" #redirects to users#index
  end


  private
  def user_params
  	#pulls params under user[x] from forms
  	params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
