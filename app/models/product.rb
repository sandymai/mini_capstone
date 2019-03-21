class Product < ApplicationRecord
  # validates :name, :price, :description, :sales_tax, :total, presence: true
  validates :name, uniqueness: true 
  validates :price, presence: true
  validates :price, numericality: {greater_than: 0}
  validates :description, length: {in: 2..1000}

  def is_discounted?
    #return true if price <= 100
    #price <=100
    if price <= 100 
      return false
    else
      return true
    end
  end

  def stock_inventory
    if price <= 100 
      return true
    else 
      return false
    end
  end
      
  def sales_tax
    price * 0.09
  end

#this code will connect the supplier id from supplier table with the products table
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end
  
  belongs_to :supplier

#images is plural because product HAS MANY imageS
  # def images
  #   Image.where(product_id: id)
  # end
  has_many :images

  # has_many :orders

  has_many :category_products
  has_many :categories, through: :category_products


  has_many :carted_products
  has_many :orders, through: :carted_products

  def total
    price + sales_tax
  end
end