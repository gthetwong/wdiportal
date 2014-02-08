class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.string :location
      t.integer :cost
      t.string :description

      t.timestamps
    end
  end
end
