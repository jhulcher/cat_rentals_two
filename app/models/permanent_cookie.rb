class PermanentCookie < ActiveRecord::Base
  validates :location, :device, :user_id, presence: true

  belongs_to :user 
end
