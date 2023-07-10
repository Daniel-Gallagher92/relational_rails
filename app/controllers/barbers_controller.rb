class BarbersController < ApplicationController
  def index 
    @barbers = Barber.all
  end

  def show 
    @barber = Barber.find(params[:id])
  end
end