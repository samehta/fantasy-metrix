class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :posts
  has_many :comments
  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'admin'
  end
end
