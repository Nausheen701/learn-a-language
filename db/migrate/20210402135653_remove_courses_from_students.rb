class RemoveCoursesFromStudents < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :courses_id, :integer
  end
end
