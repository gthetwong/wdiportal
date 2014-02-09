class AddSquadToUser < ActiveRecord::Migration
  def change
    add_reference :users, :squad, index: true
  end
end
