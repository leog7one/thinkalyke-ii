class Admin::CategoriesController < Admin::ApplicationController
	before_action :authorize_owner, except: [:index]
	before_action :set_category, only: [:edit, :update, :destroy]

	def index
		@thinkers = Thinker.all
		@thoughts = Thought.all
		@categories = Category.order(:name)
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "Category Created!"
			redirect_to admin_categories_path
		else
			flash.now[:alert] = "Category Not Created!"
			render :new
		end
	end

	def edit
	end

	def update
		if @category.update(category_params)
			flash[:notice] = "Category Updated!"
			redirect_to admin_categories_path
		else
			flash.now[:alert] = "Category Not Updated!"
			render :edit
		end
	end

	def destroy
		@category.destroy
		flash[:alert] = "Category has been deleted."
		redirect_to admin_categories_path
	end

	private

	def category_params
		params.require(:category).permit(:name, :summary)
	end

	def set_category
		@category = Category.find(params[:id])
	end

	def authorize_owner
		authenticate_thinker!
		unless current_thinker.admin?
			flash[:alert] = "You do not have permission to perform this action"
			redirect_to thoughts_path
		end
	end
end
