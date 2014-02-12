class AddGithubToUser < ActiveRecord::Migration
  def change
    add_column :users, :githubhandle, :string
  end
end
