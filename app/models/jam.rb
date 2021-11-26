class Jam < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :date, :location, :latitude, :longitude, presence: true

  reverse_geocoded_by :latitude, :longitude
  # geocoded_by :location
  # after_validation :geocode, if: :will_save_change_to_location?

  has_one_attached :photo
end
