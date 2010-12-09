class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :location
      t.integer :year
      t.integer :season_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
