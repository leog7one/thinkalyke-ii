class ThoughtSerializer < ActiveModel::Serializer
  attributes :id, :title, :thinker_id, :created_at
  has_many :comments
end
