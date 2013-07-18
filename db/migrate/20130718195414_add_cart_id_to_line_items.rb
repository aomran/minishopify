class AddCartIdToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :cart, index: true
  end
end
