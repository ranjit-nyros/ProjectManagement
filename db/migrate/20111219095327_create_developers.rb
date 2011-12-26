class CreateDevelopers < ActiveRecord::Migration
  def self.up
    create_table :developers do |t|
      t.string :developer_name
      t.string :developer_email
      t.string :developer_platform
      t.date :date_of_join
      t.string :image_path

      t.timestamps
    end
  end

  def self.down
    drop_table :developers
  end
end
