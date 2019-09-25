class Admin::OrderedItemsController < ApplicationController
  before_action :authenticate_admin

  def show
    @q = OrderedItem.ransack(params[:q])
    @ordered_items = @q.result(distinct: true).order('created_at DESC').paginate(page: params[:page]).per_page(20).where(purchaser_id: params[:id])
    @purchaser = Purchaser.find_by(id: params[:id])
  end 

  def update
    @ordered_item = OrderedItem.find_by(id: params[:id])
    @ordered_item.update! ordered_item_params
    redirect_back(fallback_location: admin_ordered_item_path)
  end

  def destroy
  end

  private

  def ordered_item_params
    params.require(:ordered_item).permit(:paid, :shipped, :completed)
  end
end
