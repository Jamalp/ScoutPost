class Subscriber < ActiveRecord::Base
  has_and_belongs_to_many :posts
  has_many :favorites
  has_many :tags, through: :favorites

  after_create :send_first_text

  devise :database_authenticatable, :registerable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lockable, :omniauthable, :omniauth_providers => [:github]

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

  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    subscriber = Subscriber.where(:provider => auth.provider, :uid => auth.uid).first
    unless subscriber
      subscriber = Subscriber.create(
                         provider: auth.provider,
                         uid: auth.uid,
                         email: auth.info.email,
                         password: Devise.friendly_token[0,20]
                        )
      # On Oauth registration, send mail from MailMan
      Mailman.registered_email(subscriber).deliver
    end
    subscriber
  end

  def self.new_with_session(params, session)
    super.tap do |sub|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        sub.email = data["email"] if sub.email.blank?
      end
    end
  end
end