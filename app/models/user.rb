class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :rents, dependent: :destroy
  has_one_attached :photo
  has_one :wishlist
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_commit :create_wishlist, on: %i[create]
  private

  def create_wishlist
    Wishlist.create(user: self)
  end
end
