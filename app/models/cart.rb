class Cart < ActiveRecord::Base
	has_many :line_items
	
	def add_product(product_id)
		line_items.build(product_id: product_id)
	end

end
