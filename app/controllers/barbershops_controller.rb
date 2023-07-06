class BarbershopsController < ApplicationController
  def index 
    @barbershops = Barbershop.all
  end

  def show 
    @barbershops = Barbershop.all
  end
end