class AddSexAndAgeToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :sex, :string
    add_column :registrations, :age, :integer
  end

  def self.down
    remove_column :registrations, :age
    remove_column :registrations, :sex
  end
end
