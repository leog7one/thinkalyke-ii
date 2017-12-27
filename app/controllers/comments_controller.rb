class CommentsController < ApplicationController
	before_action :authenticate_thinker!

	def index
		@thought = Thought.find(params[:thought_id])
		@comments = Comment.all
		@thought_comments = @thought.comments
		render 'comments/index', :layout => false
	end

	def create
		@thought = Thought.find(params[:thought_id])
		@comment = @thought.comments.build(comment_params)
		@comment.thinker = current_thinker

		if @comment.save
			flash[:notice] = "Comment Created!"
			redirect_to thought_path(@comment.thought)
			
		else
			flash.now[:alert] = "Comment Not Created!"
			render 'thoughts/show'
		end
	end

	def show
		@thought = Thought.find(params[:thought_id])
		@thought_comments = @thought.comments
		# @thinker = Thinker.find(params[:thinker_id])
		# @comments = @thinker.comments
		render @thought_comments, status: 200
	end

	def comment_params
		params.require(:comment).permit(:body)
	end

end
