class OrdersController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @stripe_amount = 500
    begin
      customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
      })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @stripe_amount,
      description: "Achat d'un produit",
      currency: 'eur',
      })
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_path
    end
    flash[:success] = "Bravo votre paiement de #{@event.price}€ a été effectué"
    redirect_to :action => "show", :controller => "event", :id => @event.id
    Attendance.create(
      event:@event, 
      attendant: current_user, 
      stripe_customer_id: customer.id
    )
  end
end
