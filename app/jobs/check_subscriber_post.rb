class CheckSubscriberPost
  @queue = :default

  def self.perform(post_id)
    post = Post.find(post_id)
    id = current_subscriber.id
    # if post.
    favorites = Favorite.all
    favorites.each do |favorite|
      if current_subscriber.id == favorite.subscriber_id && post.score >= favorite.score_threshold
        puts 'hi'
        # Resque.enqueue(SendSms, phonenumber, text)
      else
        puts "Construct additional pylons"
      end
    end
  end
end

#