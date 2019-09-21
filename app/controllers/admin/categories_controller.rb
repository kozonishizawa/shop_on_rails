class Admin::CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      redirect_to admin_categories_path, flash: {success: "カテゴリ「#{@category.name}」を登録しました"}
    else
      render :new
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.update category_params
    redirect_to admin_categories_path, flash: {success: "カテゴリ名を「#{@category.name}」に更新しました"}
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    redirect_to admin_categories_path, flash: {success: "カテゴリを削除しました"}
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

end
