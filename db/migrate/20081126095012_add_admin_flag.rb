class AddAdminFlag < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolen, :default => false
  end

  def self.down
    remove_column :users, :admin
  end
end
