class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :tech_spec
      t.date :published_date

      t.timestamps null: false
    end
  end
end
