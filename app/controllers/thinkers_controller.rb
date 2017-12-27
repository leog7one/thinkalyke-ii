class ThinkersController < ApplicationController

	def show
		@thinker = Thinker.find(params[:id])
		@comments = @thinker.comments
		render json: @thinker, status: 200
	end
end
