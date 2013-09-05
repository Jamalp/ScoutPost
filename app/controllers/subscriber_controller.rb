class SubscriberController < ApplicationController
  before_filter :authenticate_subscriber!

  def digest
   @post = Post.all
  end

  def settings
  end

end
