class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.attachment :img
      t.integer :piece_id
      t.integer :project_id

      t.timestamps null: false
    end
  end
end
