class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :name
      t.string :grade
      t.float :credits
      t.string :type
      t.string :semester_taken
      t.integer :user_id

      t.timestamps
    end
  end
end
