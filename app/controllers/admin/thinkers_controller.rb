class Admin::ThinkersController < Admin::ApplicationController

	def index
		@thinkers = Thinker.order(:email)
	end

	def show
		@thinker = Thinker.find(params[:id])
	end
end
