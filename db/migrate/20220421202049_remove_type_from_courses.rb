class RemoveTypeFromCourses < ActiveRecord::Migration[7.0]
  def change
    remove_column :courses, :type, :string
  end
end
