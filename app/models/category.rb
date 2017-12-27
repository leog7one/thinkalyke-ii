class Category < ActiveRecord::Base

	validates :name, presence: true, length: {minimum: 3}, uniqueness: true
	validates_uniqueness_of :name

	has_many :thoughts
end
