module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false
    field :posts, [Types::PostType], null: false
    field :my_posts, [Types::PostType], null: false

    def users
      User.all
    end

    def posts
      Post.all
    end

    def my_posts
      user = context[:current_user]
      user.posts
    end
  end
end
