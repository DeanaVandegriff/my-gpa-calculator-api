class Course < ApplicationRecord
  belongs_to :user

  def semester_conversion
    semester_number = {
      "9th Grade: Semester One" => 1,
      "9th Grade: Semester Two" => 2,
      "10th Grade: Semester One" => 3,
      "10th Grade: Semester Two" => 4,
      "11th Grade: Semester One" => 5,
      "11th Grade: Semester Two" => 6,
      "12th Grade: Semester One" => 7,
      "12th Grade: Semester Two" => 8,
    }
    semester_number[semester_taken]
  end
end
