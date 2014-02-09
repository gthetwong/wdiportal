class AddUserToLabs < ActiveRecord::Migration
  def change
    add_reference :labs, :user, index: true
  end
end
