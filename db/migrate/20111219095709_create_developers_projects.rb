class CreateDevelopersProjects < ActiveRecord::Migration
  def self.up
create_table :developers_projects, :id => false do |t|
      t.integer :project_id
      t.integer :developer_id
  end
end

  def self.down
drop_table :developers_projects
  end
end
