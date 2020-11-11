class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  def index
    @userdomain = UserDomain.new
  end

  def create
    @userdomain = UserDomain.new(domain_params)
    if @userdomain.valid?
      pay_item
      @userdomain.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def domain_params
    params.require(:user_domain).permit(:post_number, :prefecture_id, :town, :number, :build, :photo_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: domain_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
