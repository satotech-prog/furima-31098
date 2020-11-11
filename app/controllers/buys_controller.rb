class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @userdomain = UserDomain.new
  end

  def create
    @item = Item.find(params[:item_id])
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
    params.require(:user_domain).permit(:post_number, :prefecture_id, :town, :number, :build, :photo_number, :item_id).merge(user_id: current_user.id, token: params[:token])
  end

 def pay_item
  Payjp.api_key = "sk_test_e8125edff0d51d7fb3a3b884"  
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: domain_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
 end
end