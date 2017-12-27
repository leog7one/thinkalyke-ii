class Admin::ThinkersController < Admin::ApplicationController

	def index
		@thinkers = Thinker.order(:email)
	end
end
