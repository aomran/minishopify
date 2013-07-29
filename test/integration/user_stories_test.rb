require 'test_helper'

class SimpleTest < Capybara::Rails::TestCase
  fixtures :products

  test "purchase an item" do
    visit root_path
    within ".product_#{products(:one).id}" do
      click_button 'Add to Cart'
    end

    assert page.has_content?(products(:one).title), "Title is not on the cart page"
    click_link 'Checkout'

    assert current_path == new_order_path, "Not orders new path"
    fill_in 'Name', with: 'Ahmed'
    fill_in 'Email', with: 'ao@omran.com'
    fill_in 'Address', with: '1234 stree rd.'
    fill_in 'Pay type', with: 'credit card'
    click_button 'Create Order'

    assert page.has_content?("Thank you for your order!"), "No confirmation notice is shown"
  end
end
