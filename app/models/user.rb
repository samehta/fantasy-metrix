class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :posts
  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'admin'
  end
end
