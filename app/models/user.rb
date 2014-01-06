class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_one :contact


  before_create :on_create

  private
  
    def on_create
      # Do something
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit(:first_name, :last_name, :email, :password,
        # This is important for nested attributes
        :phone_number, :skype, :timeoutablezone,
        :password_confirmation, :current_password)
      end
    end

end
