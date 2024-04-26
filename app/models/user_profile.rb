# app/models/user_profile.rb
class UserProfile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  validates :birthdate, presence: true

  # Define o método birthdate para acessar o atributo birthdate
  def birthdate
    self[:birthdate]
  end
end
