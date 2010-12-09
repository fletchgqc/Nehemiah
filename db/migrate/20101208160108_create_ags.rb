class CreateAgs < ActiveRecord::Migration
  def self.up
    create_table :ags do |t|
      t.string :name
      t.integer :area_id

      t.timestamps
    end
  end

  def self.down
    drop_table :ags
  end
end
