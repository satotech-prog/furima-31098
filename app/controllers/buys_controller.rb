class BuysController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @userdomain = UserDomain.new
  end

  def create
    @item = Item.find(params[:item_id])
    @userdomain = UserDomain.new(domain_params)
   if @userdomain.valid?
    @userdomain.save
    redirect_to root_path
   else
    render action: :index
   end
  end

  private 

  def domain_params
    params.require(:user_domain).permit(:post_number, :prefecture_id, :town, :number, :build, :photo_number, :item_id).merge(user_id: current_user.id)
  end
end
