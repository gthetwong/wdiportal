class AddAssignmentToLab < ActiveRecord::Migration
  def change
    add_reference :labs, :assignment, index: true
  end
end
