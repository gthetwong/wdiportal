class CreateSquads < ActiveRecord::Migration
  def change
    create_table :squads do |t|

      t.timestamps
    end
  end
end
