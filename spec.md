# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project - gem 'rails', '4.2.5'
- [X] Include at least one has_many relationship - has_many :thoughts, dependent: :destroy
- [X] Include at least one belongs_to relationship - belongs_to :category
- [X] Include at least one has_many through relationship - has_many :thinkers, through: :attendances
- [X] The "through" part of the has_many through includes at least one user submittable attribute - thought.tags
- [X] Include reasonable validations for simple model objects
	validates :title, presence: true, length: {minimum: 5}
	validates :description, presence: true
	validates :venue, presence: true
	validates :location, presence: true
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature 
	def self.random_thought
		limit(4).order("RANDOM()")
	end
- [X] Include a nested form writing to an associated model using a custom attribute writer
	def tag_list=(names)
		tag_names = names.split(",").collect {|string| string.strip.downcase}.uniq
		new_or_existing_tags = tag_names.collect {|tag_name| Tag.find_or_create_by(name: tag_name)}
		self.tags = new_or_existing_tags
	end

	def tag_list
		tags.join(", ")
	end
- [X] Include signup (Devise)
- [X] Include login (Devise)
- [X] Include logout ( Devise)
- [X] Include third party signup/login (Devise/OmniAuth :facebook)
- [X] Include nested resource show or index 
- [X] Include nested resource "new" form 
	resources :thoughts do 
    resources :comments, only: [:create]
    resources :attendances, only: [:create, :destroy]
  end
- [X] Include form display of validation errors
	<div class="container">
 		<% flash.each do |type, message| %>
	<div class="alert alert-<%= type %>">
  		<%= message %>
	</div>
		<% end %>
Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate
