class BarbersController < ApplicationController
  def index 
    @barbers = Barber.all
  end

  def show 
    @barber = Barber.find(params[:id])
  end

  def edit 
    @barber = Barber.find(params[:id])
  end

  def update 
    @barber = Barber.find(params[:id])
    @barber.update(name: params[:name])

    redirect_to "/barbers/#{@barber.id}"
  end

  def create 
    barbershop = Barbershop.find(params[:id])

    barber = barbershop.barbers.create!(name: params[:name])
    redirect_to "/barbershops/#{barbershop.id}/barbers"
  end


  # private 

  # def barber_params 
  #   params.permit(:name, :id)
  # end
end