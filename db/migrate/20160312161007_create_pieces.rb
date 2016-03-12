class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.date :published_date
      t.string :place
      t.string :type
      t.string :tech_spec

      t.timestamps null: false
    end
  end
end
