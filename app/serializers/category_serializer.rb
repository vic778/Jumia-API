class CategorySerializer < ActiveModel::Serializer
  # include NullAttributesRemover
  attributes :id, :name
  has_many :sub_categories
  has_many :drawers
end
