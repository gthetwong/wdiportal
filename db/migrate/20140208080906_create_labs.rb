class CreateLabs < ActiveRecord::Migration
  def change
    create_table :labs do |t|
      t.string :url
      t.string :comment
      t.string :feeling

      t.timestamps
    end
  end
end
