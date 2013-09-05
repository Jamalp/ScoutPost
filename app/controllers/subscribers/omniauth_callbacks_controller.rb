# Ommiauth Callback example tweaked for GitHub
class Subscribers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    # You need to implement the method below in your model (e.g. app/models/subscriber.rb)
    @subscriber = Subscriber.find_for_github_oauth(request.env["omniauth.auth"], current_subscriber)

    if @subscriber.persisted?
      #this will throw if @subscription is not activated
      sign_in_and_redirect @subscriber, :event => :authentication
      set_flash_message(:notice, :success, :kind => "Github") if is_navigational_format?
    else
      session["devise.github_data"] = request.env["omniauth.auth"]
      redirect_to new_subscriber_registration_url
      # On Oauth registration, send mail from Sendgrid MailMan
      Mailman.registered_email(@subscriber).deliver
    end
  end

end
