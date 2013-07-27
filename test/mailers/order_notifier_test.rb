require 'test_helper'

class OrderNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = OrderNotifier.received(orders(:one))
    assert_equal "Order Received", mail.subject
    assert_equal [orders(:one).email], mail.to
    assert_equal ["notifier@minishopify.com"], mail.from
  end

end
