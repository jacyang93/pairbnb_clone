class Listing < ApplicationRecord
  belongs_to :user
  has_many :photos, :dependent => :destroy
  has_many :bookings, :dependent => :destroy
end
