module Mutations
  class CreateUser < BaseMutation
    argument :name, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: false
    field :token, String, null: true

    def resolve(name:, email:, password:)
      user = User.create!(
        name: name,
        email: email,
        password: password
      )

      token = AuthenticateUser.new(email: user.email, password: user.password).call
      context[:session][:token] = token

      { user: user, token: token}
    end
  end
end
