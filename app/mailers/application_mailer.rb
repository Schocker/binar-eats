class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  def payoff_mail(order, sender, item)
    @order = order
    @sender = sender
    @item = item
    @url  = item_payoff_url(id: @item.id)
    cost = @order.delivery_cost || 0
    @delivery = cost / @order.items.count
    mail(to: @item.user.email, subject: "Payoff for your item from #{@order.place.name}.")
  end

  def payment_mail(order, sender, emails)
    @order = order
    @sender = sender
    @emails = emails
    mail(to: @sender.email, subject: "List of loaners from #{@order.place.name}.")
  end
end
