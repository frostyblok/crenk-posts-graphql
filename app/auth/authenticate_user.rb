class AuthenticateUser
  def initialize(email:, password:)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode({ user_id: user.id, name: user.name}) if user
  end

  private

  attr_reader :email, :password

  def user
    user = User.find_by(email: email)

    return user if user&.authenticate(password)
  end
end