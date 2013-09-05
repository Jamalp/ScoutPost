class SubscriberController < ApplicationController

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.create(params[:subscriber])
    if @subscriber.save
      render text: "Thank you for signing up with ScoutPost!"

      # Instantiate a Twilio client
      client = Twilio::REST::Client.new(TWILIO_CONFIG[ENV['TWILIO_ACCOUNT_SID']], TWILIO_CONFIG[ENV['TWILIO_AUTH_TOKEN']])

      # Create and send an SMS message
      client.account.sms.messages.create(
        from: TWILIO_CONFIG['from'],
        to: @subscriber.phone,
        body: "Thanks for signing up. To verify your account, please reply HELLO to this message."
      )
    else
      render :new
    end
  end

  def digest
   @post = Post.all
  end

  def settings
  end

  private
    def subscriber_params
      params.require(:subscriber).permit(:name, :email, :phone)
    end
end
