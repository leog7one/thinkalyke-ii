class AddCategoryIdToThoughts < ActiveRecord::Migration
  def change
    add_column :thoughts, :category_id, :integer
    add_index :thoughts, :category_id
  end
end
