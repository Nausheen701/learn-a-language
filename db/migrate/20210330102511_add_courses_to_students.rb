class AddCoursesToStudents < ActiveRecord::Migration[6.1]
  def change
    add_reference :students, :courses, null: false, foreign_key: true
  end
end
