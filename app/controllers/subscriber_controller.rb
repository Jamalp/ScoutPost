class SubscriberController < ApplicationController

  def digest
   @post = Post.all
  end

  def settings
  end

end
