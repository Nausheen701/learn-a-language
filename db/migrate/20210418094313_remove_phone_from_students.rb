class RemovePhoneFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :phone, :integer
  end
end
