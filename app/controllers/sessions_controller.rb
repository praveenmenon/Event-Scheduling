class SessionsController < ApplicationController

	def new
		respond_to do |format|
			format.js {}
		end
	end

	def check_email
		@user = User.find_by_email(params[:email])
		respond_to do |format|
			format.json { render :json => !!@user }
		end
	end

	def create
		user = User.find_by_email(params[:email])

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to welcome_event_handler_path, :notice => "Logged in!"
			flash[:success]= "Successfully Logged In"
		else
			flash[:error]="Email id and password does not match"
			redirect_to root_path
			
		end

	end

	def index
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out!"

	end

end