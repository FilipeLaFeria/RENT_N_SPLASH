class PoolsController < ApplicationController
  #before_action :set_pool, only: [:show]

  def index
    @pools = Pool.all
    @markers = @pools.geocoded.map do|pool|
      {
        lat: pool.latitude,
        lng: pool.longitude
      }
    end
  end

  def show
    @pool = Pool.find(params[:id])
    @nearby = Pool.near(@pool, 50)
    @markers = [{
        lat: @pool.latitude,
        lng: @pool.longitude
      }]
  end

  private

  # def set_pool
  #    @pool = Pool.find(params[:id])
  # end

end
