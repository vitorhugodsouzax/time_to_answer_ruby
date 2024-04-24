class UserStatistic < ApplicationRecord
  belongs_to :user

  # Atributos virtuais
  
  def total_questions
    (self.right_questions || 0) + (self.wrong_questions || 0)
  end
end
