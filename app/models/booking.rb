class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validate :check_overlapping_dates
  validate :check_max_guests

  def check_overlapping_dates
    self.listing.bookings.each do |old_booking|
      if overlap?(self, old_booking)
        return errors.add(:overlapping_date, "Booking Date conflicts with exsting booking")
      end
    end
  end

  def overlap?(x, y)
    (x.start_date - y.end_date) * (y.start_date - x.end_date) > 0
  end


  def check_max_guests
    max_guest = self.listing.max_guest
    return if num_of_guests < max_guest
    errors.add(:max_guest, "Too many guests")
  end

  def total_price
    price = self.listing.price
    num_dates = (start_date..end_date).to_a.length
    return price * num_dates
  end
end
