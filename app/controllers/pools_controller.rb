class PoolsController < ApplicationController
  before_action :set_pool, only: [:show]
  skip_before_action :authenticate_user!, only: :index

  def index
    @pools = Pool.all
    @markers = @pools.geocoded.map do |pool|
      {
        lat: pool.latitude,
        lng: pool.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pool: pool }),
        image_url: helpers.asset_url('logo.png')
      }
    end
  end

  def show
    # @pool = Pool.find(params[:id])
    @nearby = Pool.near(@pool, 50)
    @markers = [
      {
        lat: @pool.latitude,
        lng: @pool.longitude,
        image_url: helpers.asset_url('logo.png'),
        info_window: render_to_string(partial: "info_window", locals: { pool: @pool }),
      }
    ]
    @booking = Booking.new
  end

  private

  def set_pool
     @pool = Pool.find(params[:id])
  end
end
