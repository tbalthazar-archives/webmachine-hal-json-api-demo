class TokensResource < BaseResource
  def allowed_methods
    ['POST']
  end

  def is_authorized?(_authorization_header = nil)
    true
  end

  def post_is_create?
    false
  end

  def resource_exists?
    @user = User.where(email: params['email']).first
    @user && @user.password == params['password']
  end

  def process_post
    @user.generate_token!
    response.body = %({"token":"#{@user.token}"})
    true
  end
end
