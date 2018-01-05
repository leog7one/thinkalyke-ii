class ThoughtSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :end_date, :venue, :location, :category_id, :tag_list, :image, :thinker_id
  has_many :comments
end
