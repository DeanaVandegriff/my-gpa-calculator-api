class AddPointValueToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :point_value, :float
  end
end
