# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :set_product, only: %i[show update destroy wishlist_entries]

  def index
    products_filtered_with_query
    all_products

    @products = @products.page(default_page).per(default_size)
    render json: @products,
           meta: {
             total_record_count: @products.count,
             page_size: @products.total_pages,
             page_number: @products.current_page
           }
  end

  def show
    render json: @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product

    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    authorize @product
    if @product.update(product_params)
      notify_wish_users(@product) if @product.quantity.positive?
      head :no_content
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @product
    @product.destroy
    head :no_content
  end

  def wishlist_entries
    current_user.products << @product
  end

  private

  def product_id
    params[:id] ||= params[:product_id]
  end

  def set_product
    @product = Product.find(product_id)
  end

  def product_params
    params.require(:product).permit(:name, :image, :quantity, :description)
  end

  def notify_wish_users(product)
    product.users.each do |user|
      UserProductWish.wish_product_available(product.id, user.id).deliver_later
    end
  end

  def all_products
    return if params[:query].present?

    @products = Product.all
  end

  def products_filtered_with_query
    return if params[:query].blank?

    @products = Product.all.where('name iLIKE ? OR description iLIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
  end

  def default_page
    params[:page] ||= 1
  end

  def default_size
    params[:size] ||= 10
  end
end
