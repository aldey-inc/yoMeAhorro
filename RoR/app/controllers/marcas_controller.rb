class MarcasController < ApplicationController
  def index
    @marcas = Marca.all
  end
  def new
   @marca = Marca.new
  end
  def create
    @marca = Marca.new(marca_params)
    if @marca.save
      redirect_to marcas_path
    else
      render 'new'
    end
  end

  private
    
  def marca_params
    params.require(:marca).permit(:nombre,:imagen,:empresa_id)
  end
end