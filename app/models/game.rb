class Game < ApplicationRecord
  belongs_to :category
  belongs_to :console
  belongs_to :user
end
