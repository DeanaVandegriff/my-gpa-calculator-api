class Course < ApplicationRecord
  belongs_to :user

  # def grade_point_average
  #   grade_point_average = current_user.courses.sum(:point_value) / current_user.courses.count
  # end
end

