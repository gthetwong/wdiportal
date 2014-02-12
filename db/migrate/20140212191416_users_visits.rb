class UsersVisits < ActiveRecord::Migration
  def change
  	create_table :users_visits, :id => false do |t|
	  	t.column :user_id, :integer
	    t.column :visit_id, :integer
	end
  end
end
