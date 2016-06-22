class ProductOil < ActiveRecord::Base
  belongs_to :product
  belongs_to :oil
end