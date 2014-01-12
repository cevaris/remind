class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :reminders

  before_save :save_user

  def save_user
    if self.phone_number
      self.phone_number = self.phone_number.tr('-','')
    end
  end

  validates_format_of :phone_number, with: /\d{10}|\d{3}-\d{3}-\d{4}/, message: "has an Invalid Format", allow_blank: true

  

end
