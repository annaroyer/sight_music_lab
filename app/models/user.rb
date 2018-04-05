class User < ApplicationRecord
  enum role: %w(user admin)

  def self.update_or_create(auth)
    user = User.find_by(uid: auth[:uid]) || User.new
    user.attributes = {
      uid: auth[:uid],
      email: auth[:info][:email],
      first_name: auth[:info][:first_name],
      last_name: auth[:info][:last_name],
      token: auth[:credentials][:token],
      oauth_expires_at: auth[:credentials][:expires_at]
    }
    user.save!
    user
  end
end
