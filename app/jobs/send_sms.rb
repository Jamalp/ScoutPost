class SendSms
  @queue = :default

  def self.perform(post_id)
    post = Post.find(post_id)
    favorites = Favorite.all
    favorites.each do |favorite|
      if post.score >= favorite.score_threshold
        puts 'hi'
      else
        puts "Construct additional pylons"
      end
    end
  end
end

# current_subscriber.id == favorite.subscriber_id &&