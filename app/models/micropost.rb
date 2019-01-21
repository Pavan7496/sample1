class Micropost < ApplicationRecord
  
  validates :user_id, presence: true
  validates :content, presence: true

  belongs_to :user
  #default_scope order: 'microposts.created_at DESC'
end
