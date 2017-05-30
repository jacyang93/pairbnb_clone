class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, :dependent => :destroy
  has_many :listings, :dependent => :destroy

  def self.create_with_auth_and_hash(authentication, auth_hash)
      user = User.create!(name: auth_hash["extra"]["raw_info"]["name"], email: auth_hash["extra"]["raw_info"]["email"], age: auth_hash["extra"]["raw_info"]["age_range"].min[1], birthday: auth_hash["extra"]["raw_info"]["birthday"], gender:  auth_hash["extra"]["raw_info"]["gender"])
      user.authentications << (authentication)
      return user
  end

  def fb_token
    x = self.authentications.where(:provider => :facebook).first
    return x.token unless x.nil?
  end

  def password_optional?
    true
  end
end
