class Reminder < ActiveRecord::Base

  validates :name, :notify_datetime, presence: true

  belongs_to :user
  
end
