class AddOrderIdToLineItem < ActiveRecord::Migration
  def change
    add_reference :line_items, :order, index: true
  end
end
