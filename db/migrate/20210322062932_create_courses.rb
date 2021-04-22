class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :language
      t.string :level
      t.string :age_group
      t.string :class_size
      t.string :location
      t.string :day
      t.time :start_time
      t.time :end_time
      t.integer :student_id
      t.integer :instructor_id


      t.timestamps
    end
  end
end
