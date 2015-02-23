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

		if params[:provider] == "twitter"
   		auth = request.env["omniauth.auth"]
   		if auth["extra"]["raw_info"]["id"].present? 
   			user= User.find_by_uid(auth["extra"]["raw_info"]["id"])
   		else	
	 		user = auth.find_by_provider_and_uid(auth["provider"],
   		auth["uid"]) || User.create_with_omniauth(auth)
   		end      
		else
   		user = User.authenticate(params[:email], params[:password])
		end

		if user
 			session[:user_id] = user.id
 			redirect_to  events_index_path, :notice => "Logged in!"
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