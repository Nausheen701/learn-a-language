class CreateInstructors < ActiveRecord::Migration[6.1]
  def change
    create_table :instructors do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :phone_number
      t.string :nationality
      t.string :ethnicity
      t.string :native_language
      t.string :other_languages
      t.string :instructional_languages
      t.date :date_of_birth
      t.text :education
      t.text :teaching_experience
      t.text :bio

      t.timestamps
    end
  end
end
