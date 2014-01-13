class MailerController < ApplicationController

  protect_from_forgery except: [:sms_receive]

  def sms_receive 
    Rails.logger.info params
    Rails.logger.info request.fullpath

    if params.has_key?('From') and params.has_key?('Body')
      from_phone_number = params['From'].gsub('+1','')
      message = params['Body']
      user = User.find_by_phone_number from_phone_number
      Rails.logger.info "User #{user.email} said #{message}"
    end

    render nothing: true, status: 200
  end

end