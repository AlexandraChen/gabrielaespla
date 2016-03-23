class RemoveTechSpechFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :tech_spec
  end
end
