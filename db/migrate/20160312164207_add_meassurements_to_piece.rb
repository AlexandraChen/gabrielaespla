class AddMeassurementsToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :meassurements, :string
  end
end
