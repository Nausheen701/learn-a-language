class RemoveNumberFromInstructors < ActiveRecord::Migration[6.1]
  def change
    remove_column :instructors, :number, :integer
  end
end
