class HomeController < ApplicationController
  def index
    @company=Company.find(1)
  end

  def profile
  end

  def holiday
    @holidays=Holiday.all
  end
end
