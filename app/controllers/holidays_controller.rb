class HolidaysController < ApplicationController
  def index
    @holidays=Holiday.all
  end

  def new
    @holiday = Holiday.new
  end

  def create
    @holiday = Holiday.new(holiday_params)

    if @holiday.save
      redirect_to holidays_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def holiday_params
        params.require(:holiday).permit(:start_date, :end_date, :name, :description)
    end

end
