class ThoughtSerializer < ActiveModel::Serializer
  attributes :id, :title, :thinker_id
  has_many :comments
end
