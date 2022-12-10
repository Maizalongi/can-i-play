class Game < ApplicationRecord
  belongs_to :category
  belongs_to :console
  belongs_to :user
  has_one_attached :image

  validates :price, comparison: { greater_than: 0 }

  after_commit :add_default_image, on: %i[create]
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
