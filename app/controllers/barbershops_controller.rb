class BarbershopsController < ApplicationController
  def index 
    @barbershops = Barbershop.order("created_at DESC")
  end

  def show 
    @barbershops = Barbershop.find(params[:id])
  end

  def barbers 
    @barbershop = Barbershop.find(params[:id])
    
    @barbers = @barbershop.barbers
  end
end