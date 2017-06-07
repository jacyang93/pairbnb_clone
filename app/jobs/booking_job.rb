class BookingJob < ApplicationJob
  queue_as :default

  def perform(customer_email, host, listing_id, reservation_id)
    BookingMailer.booking_email(customer_email, host, listing_id, reservation_id).deliver_now
  end
end
