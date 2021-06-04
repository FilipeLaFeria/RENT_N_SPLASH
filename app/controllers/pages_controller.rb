class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @bookings = current_user.bookings
    @markers = @bookings.map do |booking|
        {
          lat: booking.pool.latitude,
          lng: booking.pool.longitude,
          info_window: render_to_string(partial: "pools/info_window", locals: { pool: booking.pool }),
          image_url: helpers.asset_url('logo.png')
        }
    end
  end

end
