class PoolsController < ApplicationController
  # before_action :set_pool, only: [:show]

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
    @pool = Pool.find(params[:id])
    @nearby = Pool.near(@pool, 25).reject{|pool| pool == @pool}
     @markers = [
      {
        lat: @pool.latitude,
        lng: @pool.longitude,
        image_url: helpers.asset_url('logo.png'),
        info_window: render_to_string(partial: "info_window", locals: { pool: @pool }),
      }
    ]
  end

  private

  # def set_pool
  #    @pool = Pool.find(params[:id])
  # end
end
