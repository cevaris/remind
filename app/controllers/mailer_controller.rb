class MailerController < ApplicationController


  def sms_receive 
    Rails.logger.info params
    
    message_body = params["Body"]
    from_number = params["From"]
 
    Rails.logger.info "#{from_number}, #{message_body}"
    
    render nothing: true, status: 200
  end

end
