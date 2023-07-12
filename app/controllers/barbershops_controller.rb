class BarbershopsController < ApplicationController
  def index 
    @barbershops = Barbershop.order("created_at DESC")
    #.order should live in model, and we should right a model test
  end

  def show 
    @barbershops = Barbershop.find(params[:id])
  end

  def new 
  end

  def create 
    Barbershop.create!(barbershop_params)
    redirect_to '/barbershops'
  end

  def edit 
    @barbershop = Barbershop.find(params[:id])
  end

  def update 
    @barbershop = Barbershop.find(params[:id])
    @barbershop.update(barbershop_params)
    redirect_to "/barbershops/#{params[:id]}"
  end

  private

  def barbershop_params
    params.permit(:name)
  end

end