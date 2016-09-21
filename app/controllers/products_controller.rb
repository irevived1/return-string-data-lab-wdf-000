class ProductsController < ApplicationController
  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Good job."
      redirect_to products_path
    else
      flash[:notice] = "Try again."
      render 'new'
    end
  end

  def inventory
    @product = Product.find_by(id:params[:id])
    if @product && @product.inventory > 0
      return render plain: "true"
    end
    return render plain: "false"
  end

  def description
    @product = Product.find_by(id:params[:id])
    if @product && @product.description
      return render plain: @product.description
    end
    return render plain: "blank"
  end


  private
  
  def product_params
    params.require(:product).permit(:name,:price,:inventory,:description)
  end
end
