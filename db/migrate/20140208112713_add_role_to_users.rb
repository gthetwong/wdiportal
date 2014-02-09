class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :text, :default => "student"
  end
end
