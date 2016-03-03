class Rabbit < ActiveRecord::Base
  default_scope {order('created_at DESC')}
  belongs_to :user_id

  validates :content, length: {maximum: 140}

end
