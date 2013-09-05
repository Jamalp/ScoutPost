class Subscriber < ActiveRecord::Base
  has_many :favorites
  has_many :tags, through: :favorites

  after_create :send_first_text

  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable#, :confirmable

  private

  def send_first_text
      # Instantiate a Twilio client
      client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      # Create and send an SMS message
      client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: self.phone,
        body: "Thanks for signing up. You will recieve periodic message as your favorite posts appear!"
      )
  end



end
