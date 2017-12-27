class ThoughtTag < ActiveRecord::Base
  belongs_to :thought
  belongs_to :tag
end
