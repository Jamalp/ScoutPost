class Mailman < ActionMailer::Base
  default from: "TeamScoutPost@gmail.com"
  include SendGrid

  sendgrid_category :use_subject_lines
  sendgrid_enable :ganalytics, :opentrack
  sendgrid_unique_args key1: "value1", key2: "value2"

  def registered_email(subscriber)
    mail( to: subscriber.email,
          subject: "Ahoy from ScoutPost",
          body: "Hey, thanks for signing up with us over at ScoutPost! We've got a Scout on the job starting immediately so make sure you let us know what topics you're looking for."
          )
  end

  def digest_email(subscriber)
    # Daily email populated with each Subscribers tags (through Favorites) which reached the score threshold
  end

end
