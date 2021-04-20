class RemoveNumberFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :number, :integer
  end
end
