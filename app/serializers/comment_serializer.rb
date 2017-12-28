class CommentSerializer < ActiveModel::Serializer
  attributes :id, :thinker_id, :body
  # belongs_to :thought
  # belongs_to :thinker
end
