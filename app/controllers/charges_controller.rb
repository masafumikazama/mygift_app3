class ChargesController < ApplicationController
  
  
  def new
    @gift = Gift.find(params[:id])
  end
=begin 
def create
    token = params[:stripeToken]
    amount = params[:amount]
    charge = Stripe::Charge.create(
        amount: '100',
        currency: 'usd',
        source: token,
    )
    params[:charge] = charge
    flash[:success] = "Thank you for contributing!"
    redirect_back(fallback_location: root_path)
end
=end
def create
  # Amount in cents
  

  customer = Stripe::Customer.create({
    email: params[:stripeEmail],
    source: params[:stripeToken],
  })

  charge = Stripe::Charge.create({
    customer: customer.id,
    amount: '100',
    description: 'Rails Stripe customer',
    currency: 'usd',
  })
  redirect_to root_path
rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end

end
