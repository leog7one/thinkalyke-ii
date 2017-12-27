class AddThinkerToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :thinker, index: true, foreign_key: true
  end
end
