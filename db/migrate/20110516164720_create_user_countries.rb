class CreateUserCountries < ActiveRecord::Migration
  def self.up
    create_table :user_countries do |t|
      t.references :user
      t.references :country
      t.timestamps
    end
  end

  def self.down
    drop_table :user_countries
  end
end
