class CreateBuses < ActiveRecord::Migration
  def self.up
    create_table :buses do |t|
      t.string :name
      t.string :id_line
      t.string :value

      t.timestamps
    end
  end

  def self.down
    drop_table :buses
  end
end
