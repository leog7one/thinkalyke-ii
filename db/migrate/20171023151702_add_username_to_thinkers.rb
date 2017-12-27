class AddUsernameToThinkers < ActiveRecord::Migration
  def change
    add_column :thinkers, :username, :string
  end
end
