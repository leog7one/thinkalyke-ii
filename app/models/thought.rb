class Thought < ActiveRecord::Base
	attr_accessor :tag_list

	belongs_to :thinker, foreign_key: "thinker_id"
	belongs_to :category
	has_many :comments, dependent: :destroy
	has_many :attendances, dependent: :destroy
	has_many :thinkers, through: :attendances
	has_many :thought_tags, dependent: :destroy
	has_many :tags, through: :thought_tags

	validates :title, presence: true, length: {minimum: 5}
	validates :description, presence: true
	validates :venue, presence: true
	validates :location, presence: true

	mount_uploader :image, ImageUploader

	def self.random_thought
		limit(4).order("RANDOM()")
	end

	def tag_list=(names)
		tag_names = names.split(",").collect {|string| string.strip.downcase}.uniq
		new_or_existing_tags = tag_names.collect {|tag_name| Tag.find_or_create_by(name: tag_name)}
		self.tags = new_or_existing_tags
	end

	def tag_list
		tags.join(", ")
	end

	def self.next(thought)
		where('id < ?', thought.id).first
	end

	def self.previous(thought)
		where('id > ?', thought.id).last
	end

	def next
    # if the first destination is greater the current one exists then return the next destination
    if next_thought = self.class.where("id > ?", id).first
      next_thought
    else
      Thought.first
    end
  end

  def previous
    # if the destination is less then current one exists then return the previous destination
    if previous_thought = self.class.where("id < ?", id).last
      previous_thought
    else
      Thought.last
    end
  end

end

