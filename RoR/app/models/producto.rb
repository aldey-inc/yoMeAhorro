class Producto < ActiveRecord::Base
	belongs_to :marca
	belongs_to :clasificacione
	belongs_to :registro
end