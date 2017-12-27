class CreateThoughtTags < ActiveRecord::Migration
  def change
    create_table :thought_tags do |t|
      t.references :thought, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
