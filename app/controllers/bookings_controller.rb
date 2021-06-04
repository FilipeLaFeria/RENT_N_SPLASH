class BookingsController < ApplicationController
  def new
    @pool = Pool.find(params[:pool_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @pool = Pool.find(params[:pool_id])
    @booking.pool = @pool
    @booking.user = current_user
    @booking.save
    redirect_to dashboard_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:date, :pool_id, :user_id)
  end
end
