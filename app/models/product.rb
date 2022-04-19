# frozen_string_literal: true

class Product < ActiveRecord::Base
  has_many :user_products, dependent: :destroy
  has_many :users, through: :user_products
end
