class OrderNotifier < ActionMailer::Base
  default from: "notifier@minishopify.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_notifier.received.subject
  #
  def received(order)
    @order = order
    @greeting = "Hi"

    mail to: @order.email, subject: "Order Received"
  end
end
