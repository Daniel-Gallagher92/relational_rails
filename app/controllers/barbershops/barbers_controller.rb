class Barbershops::BarbersController < ApplicationController 

  def index 
    @barbershop = Barbershop.find(params[:id])
    @barbers = @barbershop.barbers
  end

  def new 
    @barbershop = Barbershop.find(params[:id])
    barber = @barbershop.barbers.create!({
      name: params[:name]
    })
  end
end
