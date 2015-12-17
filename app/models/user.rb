class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  mount_uploader :avatar, AvatarUploader

  def admin?
    role == 'admin'
  end
end
