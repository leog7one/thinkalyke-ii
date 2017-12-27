class Tag < ActiveRecord::Base
	has_many :thought_tags, dependent: :destroy
	has_many :thought, through: :thought_tags

	def to_s
		name
	end
end
