class CartsController < ApplicationController
   before_action :authenticate_cart, only: [:order]
  def index
  end 

  def show
  end


   if total_quantity <= 0
      flash[:notice] = "数量を入力して下さい"
      redirect_to("/products/#{params[:id]}")
   elsif @cart_item.quantity_XS + params[:quantity_XS].to_i > @product.stock_XS
      flash[:notice] = "X-SMALLサイズはタッチの差で別の方が購入されました。申し訳ございません。"
      redirect_to("/products/#{params[:id]}")
   elsif @cart_item.quantity_S + params[:quantity_S].to_i > @product.stock_S
      flash[:notice] = "SMALLサイズはタッチの差で別の方が購入されました。申し訳ございません。"
      redirect_to("/products/#{params[:id]}")
   elsif @cart_item.quantity_M + params[:quantity_M].to_i > @product.stock_M
      flash[:notice] = "MIDIUMサイズはタッチの差で別の方が購入されました。申し訳ございません。"
      redirect_to("/products/#{params[:id]}")
   elsif @cart_item.quantity_L + params[:quantity_L].to_i > @product.stock_L
      flash[:notice] = "LARGEサイズはタッチの差で別の方が購入されました。申し訳ございません。"
      redirect_to("/products/#{params[:id]}")
   elsif @cart_item.quantity_XL + params[:quantity_XL].to_i > @product.stock_XL
      flash[:notice] = "X-LARGEサイズはタッチの差で別の方が購入されました。申し訳ございません。"
      redirect_to("/products/#{params[:id]}")
   elsif @cart_item.quantity + params[:quantity].to_i > @product.stock
      flash[:notice] = "この商品はタッチの差で別の方が購入されました。申し訳ございません。"
      redirect_to("/products/#{params[:id]}")
   else
      @cart_item.quantity_XS += params[:quantity_XS].to_i
      @cart_item.quantity_S  += params[:quantity_S].to_i
      @cart_item.quantity_M  += params[:quantity_M].to_i
      @cart_item.quantity_L  += params[:quantity_L].to_i
      @cart_item.quantity_XL += params[:quantity_XL].to_i
      @cart_item.quantity    += params[:quantity].to_i

     if @cart_item.save
     redirect_to("/carts/show")
     flash[:notice] = "カートに商品を追加しました" 
     end
   end
  end

  def update_item
    total_quantity = params[:quantity_XS].to_i + params[:quantity_S].to_i + params[:quantity_M].to_i + params[:quantity_L].to_i + params[:quantity_XL].to_i + params[:quantity].to_i
    @product = Product.find_by(id: params[:id])
   if total_quantity <= 0
      @cart_item.destroy
      flash[:success] = "カートから商品を取り出しました"
      redirect_to("/carts/show")
   elsif params[:quantity_XS].to_i > @product.stock_XS
      flash[:danger] = "在庫数量を超えています。申し訳ございません。"
      redirect_to("/carts/show")
   elsif params[:quantity_S].to_i > @product.stock_S
      flash[:danger] = "在庫数量を超えています。申し訳ございません。"
      redirect_to("/carts/show")
   elsif params[:quantity_M].to_i > @product.stock_M
      flash[:danger] = "在庫数量を超えています。申し訳ございません。"
      redirect_to("/carts/show")
   elsif params[:quantity_L].to_i > @product.stock_L
      flash[:danger] = "在庫数量を超えています。申し訳ございません。"
      redirect_to("/carts/show")
   elsif params[:quantity_XL].to_i > @product.stock_XL
      flash[:danger] = "在庫数量を超えています。申し訳ございません。"
      redirect_to("/carts/show")
   elsif params[:quantity].to_i > @product.stock
      flash[:danger] = "在庫数量を超えています。申し訳ございません。"
      redirect_to("/carts/show")
   else
      @cart_item.update(
        quantity_XS: params[:quantity_XS].to_i,
        quantity_S: params[:quantity_S].to_i,
        quantity_M: params[:quantity_M].to_i,
        quantity_L: params[:quantity_L].to_i,
        quantity_XL: params[:quantity_XL].to_i,
        quantity: params[:quantity].to_i
        )
      flash[:notice] = "数量を更新しました" 
      redirect_to("/carts/show")
   end
  end

  def delete_item

    @cart_item.destroy
    redirect_to("/carts/show")
    flash[:notice] = "カートから商品を取り出しました"

  end

  def order
  end

private

  def cart_params
   params.require(:cart_item).permit(:quantity_XS, :quantity_S, :quantity_M, :quantity_L, :quantity_XL, :quantity)
  end

end
