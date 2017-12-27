class Comment < ActiveRecord::Base
  belongs_to :thought
  belongs_to :thinker

  validates :body, presence: true
end
