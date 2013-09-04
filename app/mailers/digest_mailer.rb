class DigestMailer < ActionMailer::Base
  default from: "TeamScoutPost@gmail.com"
  include SendGrid

  sendgrid_category :use_subject_lines
  sengrid_enable :ganalytics, :opentrack
  sengrid_unique_args key1: "value1", key2: "value2"
end