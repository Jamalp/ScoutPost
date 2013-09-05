class SubscriberController < ApplicationController
  before_filter :authenticate_subscriber!

  def digest
  end

  def settings
  end

end
