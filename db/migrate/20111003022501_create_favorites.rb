class CreateFavorites < ActiveRecord::Migration
  def self.up
    create_table :favorites do |t|
      t.integer :user_id
      t.integer :bus_id
      t.string :stop

      t.timestamps
    end
  end

  def self.down
    drop_table :favorites
  end
end
