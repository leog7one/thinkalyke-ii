class AddThinkerIdToThoughts < ActiveRecord::Migration
  def change
    add_reference :thoughts, :thinker, index: true, foreign_key: true
  end
end
