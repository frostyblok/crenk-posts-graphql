module Mutations
  class SigninUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: true
    field :token, String, null: true

    def resolve(email:, password:)
      user = User.find_by!(email: email)

      token = AuthenticateUser.new(email: email, password: password).call
      context[:session][:token] = token

      { user: user, token: token }
    end
  end
end
