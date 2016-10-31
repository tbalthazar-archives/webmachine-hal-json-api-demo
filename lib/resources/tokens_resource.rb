module WebmachineHALJSONAPIDemo
  class TokensResource < BaseResource
    def allowed_methods
      ['POST']
    end

    def is_authorized?(_authorization_header = nil)
      # In a real app, I would of course store an
      # encrypted (bcrypt) version of the password
      user && user.password == params['password']
    end

    def post_is_create?
      false
    end

    def resource_exists?
      user
    end

    def process_post
      user.generate_token!
      response.body = %({"token":"#{user.token}"})
      true
    end

    private

    def user
      @user ||= User.where(email: params['email']).first
    end
  end
end
