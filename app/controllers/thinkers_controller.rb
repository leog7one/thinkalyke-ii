class ThinkersController < ApplicationController

	def show
		@thinker = Thinker.find(params[:id])
		@comments = @thinker.comments
	end
end
