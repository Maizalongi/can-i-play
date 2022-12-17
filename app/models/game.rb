class Game < ApplicationRecord
  belongs_to :category
  belongs_to :console
  belongs_to :user
  has_many :rents, dependent: :destroy
  has_one_attached :image
  has_and_belongs_to_many :wishlists

  validates :price, comparison: { greater_than: 0 }

  after_commit :add_default_image, on: %i[create]

  include PgSearch::Model
  pg_search_scope :search_game_by_name,
    against: [ :name ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }

  private

  def add_default_image
    unless image.attached?
      image.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', img_url)),
        filename: img_url,
        content_type: 'image/jpg'
      )
    end
  end
end
