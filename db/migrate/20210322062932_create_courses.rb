class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses do |t|
      t.string :language
      t.string :level
      t.string :age_group
      t.string :class_size
      t.string :location
      t.string :day
      t.string :time


      t.timestamps
    end
  end
end
