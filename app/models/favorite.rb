class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :bus

  validates_presence_of :user_id
end
