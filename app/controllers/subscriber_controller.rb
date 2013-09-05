class SubscriberController < ApplicationController

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
