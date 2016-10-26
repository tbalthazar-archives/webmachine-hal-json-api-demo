class User < Sequel::Model
  HMAC_SECRET = 'foobarsecret'.freeze

  def generate_token!
    payload = { id: id }
    self.token = JWT.encode payload, HMAC_SECRET, 'HS256'
    save
    token
  end
end
