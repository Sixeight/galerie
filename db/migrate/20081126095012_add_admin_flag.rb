class AddAdminFlag < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolen, :default => 0
  end

  def self.down
    remove_column :users, :admin
  end
end
