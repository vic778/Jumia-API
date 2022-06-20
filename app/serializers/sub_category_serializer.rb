class SubCategorySerializer < ActiveModel::Serializer
  attributes :name
  has_many :drawers
end
