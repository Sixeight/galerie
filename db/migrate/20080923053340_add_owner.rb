class AddOwner < ActiveRecord::Migration
  def self.up
    add_column :images, :user_id, :integer
  end

  def self.down
    remove_column :images, :user_id
  end
end
