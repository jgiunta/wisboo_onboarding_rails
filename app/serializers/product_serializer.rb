class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :quantity, :description
end
