class CategoriesController < ApplicationController

	def show
		@category = Category.find(params[:id])
		@categories = Category.order(:name)
		@category_thoughts = @category.thoughts.order(:created_at)

		rescue ActiveRecord::RecordNotFound
        flash[:alert] = "The page you requested is not found"
        redirect_to (request.referrer || thoughts_path) 
	end
end
