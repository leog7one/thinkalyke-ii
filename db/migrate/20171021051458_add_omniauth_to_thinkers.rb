class AddOmniauthToThinkers < ActiveRecord::Migration
  def change
    add_column :thinkers, :provider, :string
    add_column :thinkers, :uid, :string
  end
end
