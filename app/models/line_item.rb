class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart

  def decrement_or_destroy
    if self.quantity > 1
      self.quantity -= 1
      self.save
    else
      self.destroy
    end
  end
end
