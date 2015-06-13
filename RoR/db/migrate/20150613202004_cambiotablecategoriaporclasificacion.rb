class Cambiotablecategoriaporclasificacion < ActiveRecord::Migration
  def change
  	rename_table :categorias, :clasificaciones
  end
end
