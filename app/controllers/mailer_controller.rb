class MailerController < ApplicationController

  protect_from_forgery :except => ["sms_receive"]

  def sms_receive 
    Rails.logger.info params

    if params.has_key?('From') and params.has_key?('Body')
      from_phone_number = params['From'].tr('+1','')
      message = params['Body']

      user = User.where( phone_number: from_phone_number )
      Rails.logger.info "User #{user.email} said #{message}"
    end

    render nothing: true, status: 200
  end

end