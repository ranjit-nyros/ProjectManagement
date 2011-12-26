class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :project_title
      t.text :project_description
      t.date :project_started
      t.date :project_ended
      t.string :project_platform
      t.string :project_owner

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
