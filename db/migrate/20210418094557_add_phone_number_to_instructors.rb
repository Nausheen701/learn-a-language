class AddPhoneNumberToInstructors < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :phone_number, :string
  end
end
