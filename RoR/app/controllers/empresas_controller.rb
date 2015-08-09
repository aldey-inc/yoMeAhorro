class EmpresasController < ApplicationController

  def new
    @empresa=Empresa.new
  end

  def create
    @empresa = Empresa.new(empresa_params)
    
    if @empresa.save
      redirect_to empresas_path
      #poner un flash que todo salió de manera correcata
    else
      #poner algo para avisar que algo salio de manera incorrecta
      render 'new'
    end
  end

  def index
    @empresas= Empresa.all
  end

  private

  def empresa_params
    params.require(:empresa).permit(:nombre, :descripcion, :direccion)
  end
end