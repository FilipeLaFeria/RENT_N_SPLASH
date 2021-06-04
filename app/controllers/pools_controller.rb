class PoolsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_pool, only: %i[show edit update destroy]

  def index
    if params[:query].present?
      @pools = Pool.global_search(params[:query])
    else
      @pools = Pool.all
    end
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
    @booking = Booking.new
  end

  def my_pools
    @pools = current_user.pools
    @markers = @pools.geocoded.map do |pool|
        {
          lat: pool.latitude,
          lng: pool.longitude,
          info_window: render_to_string(partial: "info_window", locals: { pool: pool }),
          image_url: helpers.asset_url('logo.png')
        }
    end
  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
    @pool.user = current_user
    if @pool.save
      redirect_to my_pools_path, notice: 'Pool was successfully added'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @pool.update(pool_params)
    redirect_to my_pools_path
  end

  def destroy
    @pool.destroy
    redirect_to my_pools_path, notice: 'Pool was successfully destroyed'
  end

  private

  def set_pool
    @pool = Pool.find(params[:id])
  end

  def pool_params
    params.require(:pool).permit(:title, :address, :size, :description, :photo)
  end
end
