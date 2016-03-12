class RenameMeasurements < ActiveRecord::Migration
  def change
    rename_column :pieces, :meassurements, :measurement
  end
end
