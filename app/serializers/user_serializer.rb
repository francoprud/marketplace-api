class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :created_at, :auth_token
  has_many :products, embed: :ids
end
