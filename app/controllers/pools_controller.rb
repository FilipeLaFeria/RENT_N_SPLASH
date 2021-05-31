class PoolsController < ApplicationController
  before_action :set_pool, only: %i[show edit update destroy]


  def index
    @pools = Pool.all
  end

  def show

  end

  def new
    @pool = Pool.new
  end

  def create
    @pool = Pool.new(pool_params)
    if @pool.save
      redirect_to pool_path(@pool), notice: "Pool was successfully created"
    else
      render: new
  end

  def edit

  end

  def update
    @pool.update(pool_params)
    redirect_to pool_path(@pool)
  end

  def destroy
    @pool.destroy
    redirect_to pools_path
  end

  private

  def pool_params
    params.require(:pool).permit(:title, :address, :size, :description)
  end

  def set_pool
    @pool = Pool.find(params[:id])
  end

end
