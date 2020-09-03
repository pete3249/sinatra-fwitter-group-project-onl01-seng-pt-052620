class User < ActiveRecord::Base
  has_secure_password
  # validates :username, presence: true, uniqueness: true
  # validates :email, presence: true
  # validates :password, presence: true
  has_many :tweets

  def slug
    username.downcase.downcase.gsub(" ","-")
  end 

  def self.find_by_slug(slug)
    User.all.find do |user|
      user.slug == slug
    end

  end

end
