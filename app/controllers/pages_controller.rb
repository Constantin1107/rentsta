class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def confirmation
    @booking = current_user.bookings.last
    @listing = @booking.listing if @booking.present?
  end

  def my_listings
    @listings = Listing.where(user_id: current_user.id)
  end

  def inbox
    @bookings = Booking.for(current_user)
  end

  def my_bookings
    @bookings = Booking.where(user_id: current_user.id)
  end

  def edit_account
  end
end
