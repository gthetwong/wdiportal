class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :home
      t.string :about

      t.timestamps
    end
  end
end
