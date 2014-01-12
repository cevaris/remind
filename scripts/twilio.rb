#!/usr/bin/env ruby

require 'optparse'
require 'twilio-ruby'

TWILIO = {
  sid:   'AC81c89a5e48e374426cda01507e7fea51',
  auth:  '2a25747856ce98d25cd93bc88832dcc7',
  phone: '+13039004104'
}

def route_command()
  puts $options

  if $options[:sms]
    puts "Sending SMS [#{$options[:message]}] to #{$options[:to]}"
    send_sms({ to: $options[:to], message: $options[:message] })
  end

end


def send_sms(info)
   
  twilio_sid = TWILIO[:sid]
  twilio_token = TWILIO[:auth]
  twilio_phone_number = TWILIO[:phone] #"6165555555"
  message = info[:message]

  @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

  sms = @twilio_client.account.messages.create(
    :from => twilio_phone_number,
    :to => info[:to],
    :body => info[:message],
    :url => "http://dev-remind.herokuapp.com/sms/receive?=111"
  )

end



if __FILE__ == $0

  $options = {}

  optparse = OptionParser.new do|opts|
    opts.banner = "Usage: twilo.rb [options]"

    $options[:verbose] = false
      opts.on( '-v', '--verbose', 'Output more information' ) do
      $options[:verbose] = true
    end

    $options[:sms] = false
    opts.on( '-s', '--sms', 'Send SMS/Text if flag is set.' ) do|value|
      $options[:sms] = true
    end

    $options[:to] = false
    opts.on( '-t', '--to PHONE', 'Phone number to send to.' ) do|value|
      $options[:to] = "+1#{value}"
    end

    $options[:message] = "Welcome to reminder!"
    opts.on( '-m', '--message STRING', 'Message/Body to send.' ) do|value|
      $options[:message] = value
    end

    opts.on( '-h', '--help', 'Display this screen' ) do
      puts opts
      exit
    end
  end

  optparse.parse!

  route_command()
end