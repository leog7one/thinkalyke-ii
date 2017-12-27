class HomeController < ApplicationController

	def index
		@thoughts = Thought.all
	end
end
