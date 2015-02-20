class WelcomeController < ApplicationController
	before_filter :require_login, :only=>[:event_handler]
	def index
	end

	def event_handler
	end
	
end