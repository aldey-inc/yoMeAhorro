class Marca < ActiveRecord::Base
	mount_uploader :imagen, ImagenUploader
  has_many :productos
  belongs_to :empresa
 
end