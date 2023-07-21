class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :name, :role
end
