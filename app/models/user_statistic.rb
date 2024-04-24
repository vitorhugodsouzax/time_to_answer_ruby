class UserStatistic < ApplicationRecord
  belongs_to :user

  # Virtual Attributes
  def total_questions
    (right_questions || 0) + (wrong_questions || 0)
  end
end