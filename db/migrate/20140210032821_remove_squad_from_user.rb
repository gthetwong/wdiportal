class RemoveSquadFromUser < ActiveRecord::Migration
  def change
  	remove_reference :users, :squad
  end
end
