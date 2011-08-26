class FixIdLineName < ActiveRecord::Migration
  def self.up
  	rename_column :buses, :id_line, :line_id
  end

  def self.down
  	rename_column :buses, :line_id, :id_line
  end
end
