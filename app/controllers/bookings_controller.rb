# class BookingsController < ApplicationController
#   def new
#     @pool = Pool.find(params[:pool_id])
#     @booking = Booking.new
#   end

#   def create
#     @booking = Booking.new(booking_params)
#     @pool = Pool.find(params[:pool_id])
#     @booking.pool = @pool
#     if @booking.save
#       redirect_to pool_path(@pool)
#     else
#       render :new
#     end
#   end

#   private

#   def booking_params
#     params.require(:booking).permit(:date)
#   end
# end
