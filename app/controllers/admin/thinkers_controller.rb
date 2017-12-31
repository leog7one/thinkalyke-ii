class Admin::ThinkersController < Admin::ApplicationController

	def index
		@thinkers = Thinker.order(:username)
	end

	def show
		@thinker = Thinker.find(params[:id])
		@thinkers = Thinker.order(created_at: :desc)
	end
end
