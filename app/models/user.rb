class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  has_many :articles
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  
  mount_uploader :avatar, AvatarUploader

  validates :username, length: { minimum: 3 }
  validates :username, length: { maximum: 10 }
  validates :username, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates_uniqueness_of :username, case_sensitive: false

  def admin?
    role == 'admin'
  end
end