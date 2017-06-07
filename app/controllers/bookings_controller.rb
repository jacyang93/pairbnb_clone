class BookingsController < ApplicationController
  def create
    @listing = Listing.find(params[:listing_id])
    @booking = current_user.bookings.new(booking_params)
    @booking.user_id = current_user.id
    @booking.listing = @listing
    if @booking.save
      @host = User.find(@listing.user_id)
      BookingJob.perform_later(current_user.email, @host, @booking.listing.id, @booking.id)

      # BookingMailer.booking_email(current_user.email, @host, @booking.listing.id, @booking.id).deliver_now
      redirect_to current_user
    else
      @errors = @booking.errors.full_messages
      render "listings/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to current_user
  end

  def booking_params
    params.require(:booking).permit(:num_of_guests, :start_date, :end_date)
  end
end
