class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :articles
  
  mount_uploader :avatar, AvatarUploader

  validates_uniqueness_of :username, case_sensitive: false

  def admin?
    role == 'admin'
  end
end
