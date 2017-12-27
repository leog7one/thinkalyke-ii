class ThinkerSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :thoughts
  has_many :comments
end
