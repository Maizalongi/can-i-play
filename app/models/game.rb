class Game < ApplicationRecord
  belongs_to :category
  belongs_to :console
  belongs_to :user

  validates :price, comparison: { greater_than: 0 }
end
