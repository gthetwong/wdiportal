class AddInstructorToGists < ActiveRecord::Migration
  def change
    add_column :gists, :instructor, :string
  end
end
