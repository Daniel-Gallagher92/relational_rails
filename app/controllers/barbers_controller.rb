class BarbersController < ApplicationController
  def index 
    @barbers = Barber.all
  end

  def show 
    # @barbers = Barber.all
  end
end