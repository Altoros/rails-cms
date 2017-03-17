class ChargesController < ApplicationController
  def new
    @image = Image.find_by(id: charge_params[:image_id])
  end

  def create
    image = Image.find_by(id: charge_params[:image_id])
    @amount = image.price

    if image.price != charge_params[:price].to_f
      raise "The price does not match, please check and do it again"
    end

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => image.price,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

    Picture.create user_id: current_user.id, image_id: image.id

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private
    def charge_params
      params.permit(:stripeToken, :stripeEmail, :image_id, :price)
    end
end
