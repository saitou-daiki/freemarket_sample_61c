class ProductsController < ApplicationController
  def index

  end

  def new
    if user_signed_in?
      @product = Product.new
      10.products{@product.images.build}
    else
      redirect_to new_user_session_path
    end
  end

  def create
    # Product.create(create_params)

    # Product.create(title: product_params[:title], description: product_params[:description], user_id: current_user.id)
    # binding.pry
    @product = Product.create(create_params)
    # if @product.save
    #   redirect_to root_path
    # else
    #   redirect_to action: :new
    # end
  end
  
  def show
    @post = Post.new
  end


private  

  def product_params
    params.permit(:title, :description)
  end

  def image_params
    params.require(:image).permit({images:[]})
  end  

  def create_params
    params.require(:product).permit(:title, :description, :category_id, :brand_id, :size, :brand_id, :condition, :shipping_burden, :shipping_area, :shipping_method, :shipping_period, :price, :buyer_id, :created_at, :updated_at, images_attributes: [:url, :id]).merge(user_id: current_user.id)
  end


end
