class CommentSerializer < ActiveModel::Serializer
  attributes :id, :thinker_id, :body, :thought, :created_at
  belongs_to :thought
  belongs_to :thinker
end
