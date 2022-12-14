class Game < ApplicationRecord
  belongs_to :category
  belongs_to :console
  belongs_to :user
  has_many :rents, dependent: :destroy
  has_one_attached :image

  validates :price, comparison: { greater_than: 0 }

end
