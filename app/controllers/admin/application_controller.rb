class Admin::ApplicationController < ApplicationController

	before_action :authorize_admin!

  def index
  	@thinkers = Thinker.all
  	@thoughts = Thought.all
  	@categories = Category.all
  	@comments = Comment.all
  	@attendances = Attendance.all
  end



	private

	def authorize_admin!
		authenticate_thinker!

		unless current_thinker.admin?
			flash[:alert] = "You do not have permission to perform this action"
			redirect_to thoughts_path
		end
	end
end
