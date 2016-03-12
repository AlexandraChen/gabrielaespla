class AddUserIdToProjectAndPiece < ActiveRecord::Migration
  def change
    add_column :projects, :user_id, :integer
    add_column :pieces, :user_id, :integer
  end
end
