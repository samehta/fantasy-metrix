class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  default_scope { order('created_at ASC') }
end