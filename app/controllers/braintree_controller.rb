class BraintreeController < ApplicationController
  def new
    @client_token = Braintree::ClientToken.generate
    @booking = Booking.find(params[:booking_id])
  end

  def create
  @booking = Booking.find(params[:booking_id])
  nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

  amount = @booking.total_price

  result = Braintree::Transaction.sale(
   :amount => amount,
   :payment_method_nonce => nonce_from_the_client,
   :options => {
      :submit_for_settlement => true
    }
   )

    if result.success?
      redirect_to :root, :flash => { :success => "Transaction successful!" }
    else
      redirect_to :root, :flash => { :error => "Transaction failed. Please try again." }
    end
  end
end
