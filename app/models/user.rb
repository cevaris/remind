class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :reminders
  
  validates_format_of :phone_number, with: /\d{3}-\d{3}-\d{4}/, message: "has an Invalid Format", allow_blank: true

end
