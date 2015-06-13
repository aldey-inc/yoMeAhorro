class Cambiodecolumnacategoriaid < ActiveRecord::Migration
  def change
  	rename_column :productos, :categoria_id, :clasificacion_id
  end
end
