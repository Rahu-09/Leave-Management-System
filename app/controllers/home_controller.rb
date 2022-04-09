class HomeController < ApplicationController
  def index
  end

  def profile
  end

  def holiday
    @holidays=Holiday.all
  end
end
