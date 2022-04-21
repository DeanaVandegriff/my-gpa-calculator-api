class AddLevelToCourses < ActiveRecord::Migration[7.0]
  def change
    add_column :courses, :level, :string
  end
end
