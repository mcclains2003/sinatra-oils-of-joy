class Product < ActiveRecord::Base
  has_many :oils, :through => :product_oils
  has_many :variants, :through => :product_variants
  has_many :product_oils
  has_many :product_variants
  belongs_to :user

  validates :name, presence: true
  validates :type, presence: true
end