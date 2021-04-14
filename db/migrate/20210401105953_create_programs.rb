class CreatePrograms < ActiveRecord::Migration[6.1]
  def change
    create_table :programs do |t|
      t.string :language
      t.string :level
      t.string :location

      t.timestamps
    end
  end
end
