module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :signin_user, mutation: Mutations::SigninUser
    field :create_post, mutation: Mutations::CreatePost
  end
end
