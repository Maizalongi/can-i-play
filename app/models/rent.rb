class Rent < ApplicationRecord
  belongs_to :game
  belongs_to :user

  validate :rent_different_from_owner
  def rent_different_from_owner
    return false if Game.find_by(user_id: self.user_id).user_id == self.user_id
  end
end
