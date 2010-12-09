class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations do |t|
      t.string :name
      t.string :comments
      t.integer :event_id
      t.integer :ag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
