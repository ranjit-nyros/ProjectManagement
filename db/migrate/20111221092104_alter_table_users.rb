class AlterTableUsers < ActiveRecord::Migration
  def self.up
    rename_column("users","name", "username")
    add_column("users", "first_name", :string, :limit => 25)
    add_column("users", "last_name", :string, :limit => 25)
    add_column("users", "email", :string, :limit => 30)
    add_column("users", "salt", :string, :limit => 40)
    
  end

  def self.down
    remove_column("users", "salt")
    rename_column("users", "username", "name")
    remove_column("users", "email")
    remove_column("users", "first_name")
    remove_column("users", "last_name")
  end
end
