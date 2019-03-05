class Product < ApplicationRecord
  def is_discounted?
    #return true if price <= 100
    #price <=100
    if price <= 100 
      return false
    else
      return true
    end
  end

  def sales_tax
    price * 0.09
  end

  def total
    price + sales_tax
  end
end