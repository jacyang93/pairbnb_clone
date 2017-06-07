class BookingMailer < ApplicationMailer
  default from: 'pairbnb123123@gmail.com'

  def booking_email(customer_email, host, listing_id, reservation_id)
    @host = host
    @customer_email = customer_email
    @listing = Listing.find(listing_id)
    #once customer reserved a listing, it will send email to the listing host.
    mail(to: @host.email, subject: "You have received a booking from #{@customer_email}")
  end
end
