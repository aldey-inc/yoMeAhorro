class AddColumn < ActiveRecord::Migration
  def change
    add_column :marcas, :imagen, :string
  end
end
