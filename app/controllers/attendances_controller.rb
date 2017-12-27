class AttendancesController < ApplicationController
	before_action :authenticate_thinker!
	before_action :set_thought

	def create
		@attendance = @thought.attendances.where(thinker: current_thinker).first_or_create

		if @attendance.save
			flash[:notice] = "You are now registered for this Thought!"
			redirect_to thinker_path(current_thinker)
		else
			flash.now[:alert] = "Thought registration failed."
			render 'thoughts/show'
		end
	end

	def destroy
		@attendance = @thought.attendances(params[:id])

		@attendance.delete_all
			flash[:alert] = "You have been unregistered from this Thought"
			redirect_to thinker_path(current_thinker)
	end


	private

	def set_thought
		@thought = Thought.find(params[:thought_id])
	end

end
