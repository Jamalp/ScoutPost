class DigestMailer < ActionMailer::Base
  default from: "TeamScoutPost@gmail.com"
  include SendGrid

  sendgrid_category :use_subject_lines
  sendgrid_enable :ganalytics, :opentrack
  sendgrid_unique_args key1: "value1", key2: "value2"
end