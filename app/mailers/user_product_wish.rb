class UserProductWish < ApplicationMailer
  default from: 'info@wisboo.com'

  def wish_product_available(product_id, user_id)
    @product = Product.find(product_id)
    @user = User.find(user_id)
    mail(to: @user.email, subject: 'El producto está disponible')
  end
end
