class AddColumnToProductos < ActiveRecord::Migration
  def change
    add_column :productos, :imagen, :string
  end
end
