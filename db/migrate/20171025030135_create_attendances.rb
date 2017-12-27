class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.references :thought, index: true, foreign_key: true
      t.references :thinker, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
