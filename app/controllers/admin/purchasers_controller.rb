class Admin::PurchasersController < ApplicationController
  before_action :authenticate_admin

  def index
    @q = Purchaser.ransack(params[:q])
    @purchasers = @q.result(distinct: true).order('created_at DESC').paginate(page: params[:page]).per_page(20)
  end

  def show
    @purchaser = Purchaser.find_by(id: params[:id])
  end

  def edit
    @purchaser = Purchaser.find_by(id: params[:id])
  end

  def update
    @purchaser = Purchaser.find_by(id: params[:id])
    @purchaser.update purchaser_params
    redirect_to admin_purchasers_path, flash: {success: '購入者情報を更新しました'}
  end

  def destroy
    @purchaser = Purchaser.find_by(id: params[:id])
    @purchaser.destroy
    redirect_to admin_purchasers_path, flash: {success: '購入者情報を削除しました'}
  end

  private

  def purchaser_params
    params.require(:purchaser).permit(:kana, :last_name, :first_name, :postal_code, :prefecture, :city, :address, :phone_number, :email, :email_confirmation, :user_id)
  end

end
