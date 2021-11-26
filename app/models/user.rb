class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  after_commit :set_default_avatar, on: :create

  private

  def set_default_avatar
    unless avatar.attached?
      image = URI.open("https://res.cloudinary.com/gmrcp/image/upload/c_scale,w_100/v1637893580/jammin/Fender_Play_Lifestyle_1318_j0ighb.jpg")
      avatar.attach(io: image, filename: "default.jpg", content_type: 'image/jpg')
    end
  end
end
