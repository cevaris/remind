class MailerController < ApplicationController

  protect_from_forgery :except => ["sms_receive"]


  def sms_receive 
    Rails.logger.info params
  
    
    render nothing: true, status: 200
  end

end
