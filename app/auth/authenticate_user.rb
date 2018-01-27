class AuthenticateUser
  def initialize(email, password)
    @email, @password = email, password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private

    attr_reader :email, :password

    def user
      user = User.find_by(email: email)
      return user if user && user.authenticate(password)
      raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
    end
end