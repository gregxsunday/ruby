class MonthsController < ApplicationController
  @@year = 2019
  def index
    @year = @@year
  end

  def show
    @month =  params[:id].to_i
    d = Date.new(@@year.to_i, @month, 1)
    @arr = Array.new(42, "")
    first_day = d.wday
    while d.mon == @month do
      @arr[first_day + d.day - 2] = d.day
      d += 1
    end
  end

  def update
    @@year = params[:year].to_i
    redirect_to '/months'
  end
end
