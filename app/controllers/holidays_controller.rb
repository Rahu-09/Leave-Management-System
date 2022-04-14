class HolidaysController < ApplicationController
  def index
    @holidays=Holiday.all
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  def new
    @holiday = Holiday.new
  end

  def import
    Holiday.import(params[:file])
    redirect_to root_url, notice: "Holiday imported."
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
