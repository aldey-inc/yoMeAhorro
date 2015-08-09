class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :marcas, :Empresas_id, :empresa_id
    rename_column :listas, :usuarios_id, :usuario_id
    rename_column :listas, :productos_id, :producto_id
    rename_column :puntuaciones, :usuarios_id, :usuario_id
    rename_column :puntuaciones, :productos_id, :producto_id
    
  end
end
