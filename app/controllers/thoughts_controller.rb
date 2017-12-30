class ThoughtsController < ApplicationController
  before_action :set_thought, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_thinker!, except: [:index, :show]
  before_action :authorize_owner, only: [:edit, :update, :destroy]


  def index
    @thoughts = Thought.order(created_at: :desc).paginate(page: params[:page], :per_page => 7)
    @categories = Category.order(:name)
  end


  def show
    @comment = Comment.new
    @comment.thought_id = @thought.id
    @thoughts = Thought.order(created_at: :desc)
  end


  def new
    @thought = Thought.new
  end


  def edit
  end

  def create
    @thought = Thought.new(thought_params)
    @thought.thinker = current_thinker

      if @thought.save
        flash[:notice] = "Thought Created!"
      redirect_to thought_path(@thought)
    else
      flash.now[:alert] = "Thought Not Created!"
      render :new
      end
  end


  def update
      if @thought.update(thought_params)
        flash[:notice] = 'Thought was successfully updated.'
        redirect_to thought_path(@thought)
      else
        flash.now[:alert] = "Thought Not Updated!"
      render :edit
    end
  end


  def destroy
    @thought.destroy
      flash[:alert] = "Thought has been deleted"
      redirect_to thoughts_path
  end

  private



    def set_thought
      @thought = Thought.find(params[:id])

      rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The page you requested is not found"
        redirect_to thoughts_path
    end

    def authorize_owner
      :authenticate_thinker!

      unless @thought.thinker == current_thinker || current_thinker.admin?
        flash[:alert] = "You do not have permission to perform this action"
        redirect_to thoughts_path
      end
    end


    def thought_params
      params.require(:thought).permit(:title, :description, :start_date, :end_date, :venue, :location, :category_id, :tag_list, :image)
    end
end
