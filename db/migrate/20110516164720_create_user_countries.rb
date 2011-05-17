class CreateUserCountries < ActiveRecord::Migration
  def self.up
    create_table :user_countries do |t|
      t.belongs_to :user
      t.string :country_id
      t.timestamps
    end
  end

  def self.down
    drop_table :user_countries
  end
end
