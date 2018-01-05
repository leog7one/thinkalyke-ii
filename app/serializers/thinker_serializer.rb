class ThinkerSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :created_at, :comments
  has_many :thoughts
  has_many :comments
end
