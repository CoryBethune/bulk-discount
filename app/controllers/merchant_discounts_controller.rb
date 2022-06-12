class MerchantDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:merchant_id])
  end

  def show
  end

  def new
  end

  def create
    if params[:quantity].present? && params[:percent_discount].present?
      Discount.create(quantity: params[:quantity], percent_discount: params[:percent_discount], merchant_id: params[:merchant_id])
      redirect_to action: :index
    end
  end

end
