class Admin::ThinkersController < Admin::ApplicationController

	def index
		@thinkers = Thinker.order(:username)
	end

	def show
		@thinker = Thinker.find(params[:id])
	end
end
