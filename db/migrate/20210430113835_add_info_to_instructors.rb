class AddInfoToInstructors < ActiveRecord::Migration[6.1]
  def change
    add_column :instructors, :uid, :string
    add_column :instructors, :provider, :string
  end
end
