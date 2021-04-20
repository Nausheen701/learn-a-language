class RemovePhoneFromInstructors < ActiveRecord::Migration[6.1]
  def change
    remove_column :instructors, :phone, :integer
  end
end
