class User < ApplicationRecord

  def self.update_or_create(auth)
    where(uid: auth[:uid]).first_or_create do |user|
      user.uid = auth[:uid]
      user.provider = auth[:provider]
      user.nickname = auth[:info][:nickname]
      user.name = auth[:info][:name]
      user.email = auth[:info][:email]
      user.image = auth[:info][:image]
      user.token = auth[:credentials][:token]
    end
  end

end
