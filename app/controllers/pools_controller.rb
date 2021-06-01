class PoolsController < ApplicationController
  #before_action :set_pool, only: [:show]

  def show
    @pool = Pool.find(params[:id])
  end

  private

  # def set_pool
  #    @pool = Pool.find(params[:id])
  # end

end
