class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :pools

  def home
  end
end
