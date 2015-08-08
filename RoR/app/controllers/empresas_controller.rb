class EmpresasController < ApplicationController

	def new

	end

	def create
	end

	def index
		@empresas= Empresa.all
	end

	private

	def empresa_param
		params.require(:empresa).permit()
	end
end