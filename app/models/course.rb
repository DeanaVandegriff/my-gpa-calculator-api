class Course < ApplicationRecord
  belongs_to :user

  before_save :calculate_points

  def point_value
    @grades = {
      "A+" => 4.33,
      "A" => 4.00,
      "A-" => 3.67,
      "B+" => 3.33,
      "B" => 3.00,
      "B-" => 2.67,
      "C+" => 2.33,
      "C" => 2.00,
      "C-" => 1.67,
      "D+" => 1.33,
      "D" => 1.00,
      "D-" => 0.67,
      "F" => 0.00,
    }
    @point_value = @grades[grade] * 0.5
    self.point_value = point_value
  end
end
