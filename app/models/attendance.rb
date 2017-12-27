class Attendance < ActiveRecord::Base
  belongs_to :attended_thought, class_name: "Thought", foreign_key: 'thought_id'
  belongs_to :thinker
end
