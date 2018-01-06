class Admin::ThinkersController < Admin::ApplicationController

	def index
		@thinkers = Thinker.order(:username)
		
	end

	def show
		@thinker = Thinker.find(params[:id])
		respond_to do |format|
      format.html { render :show }
      format.json { render json: @thinker }
    end
	end

	def next_thinker
    @thinker = Thinker.find(params[:id])
    @next_thinker = @thinker.next
    render json: @next_thinker
  end

  def previous_thinker
    @thinker = Thinker.find(params[:id])
    @previous_thinker = @thinker.previous
    render json: @previous_thinker
  end
end
