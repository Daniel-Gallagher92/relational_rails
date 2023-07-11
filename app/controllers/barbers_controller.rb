class BarbersController < ApplicationController
  def index 
    @barbers = Barber.all
  end

  def show 
    @barber = Barber.find(params[:id])
  end
  
  def new 
  end

  def create 
    barbershop = Barbershop.find(params[:id])

    barber = barbershop.barber.create(name: params[:name])
    redirect_to "barbershops/#{barbershop.id}/barbers"
  end


  # private 

  # def barber_params 
  #   params.permit(:name, :id)
  # end
end