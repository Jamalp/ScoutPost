# Queue up with Resque.enqueue(SendSms, "617-697-5208", "Sup")
# test in the rails console with SendSms.perform("617-697-5208", "testing")

class SendSms
  @queue = :default

  def self.perform(phone_number, text_message)
    # Instantiate a Twilio client
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    # Create and send an SMS message
    client.account.sms.messages.create(
      from: TWILIO_CONFIG['from'],
      to: phone_number,
      body: text_message
    )
  end
end

