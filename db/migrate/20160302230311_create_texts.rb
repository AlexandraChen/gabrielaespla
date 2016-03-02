class CreateTexts < ActiveRecord::Migration
  def change
    create_table :texts do |t|
      t.string :title
      t.string :content
      t.date :published_date
      t.string :place

      t.timestamps null: false
    end
  end
end
