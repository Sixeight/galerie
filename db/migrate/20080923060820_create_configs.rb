class CreateConfigs < ActiveRecord::Migration
  def self.up
    create_table :configs do |t|
      t.string :title
      t.boolen :private, :default => false

      t.user_id :integer

      t.timestamps
    end
  end

  def self.down
    drop_table :configs
  end
end
