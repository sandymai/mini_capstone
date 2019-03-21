class Image < ApplicationRecord
#product is singular
  # def product
  #   Product.find_by(id: product_id)
  # end
  belongs_to :product

end