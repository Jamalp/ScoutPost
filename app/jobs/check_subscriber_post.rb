class CheckSubscriberPost
  @queue = :default

  def self.perform(post_id)
    post = Post.find(post_id)
    subscribers = Subscriber.all
    subscribers.each do |subscriber|
      begin
        found_post = subscriber.posts.find(post_id)
      rescue ActiveRecord::RecordNotFound
        found_post = nil
      end
      if found_post.nil?
        favorites = Favorite.where(subscriber_id: subscriber.id)
        added = false
        favorites.each do |favorite|
          puts favorite.tag.name
          tag_id = favorite.tag.id
          # if post is tagged with a subscriber's favorited tag
          begin
            if post.tags.find(tag_id) && post.score >= favorite.score_threshold
              puts "#{favorite.tag.name}: found this one"
              # Resque.enqueue(SendSms, subscriber.phone, "We found a new article about #{favorite.tag.name}!")
              # Resque.enqueue(SendEmail, whatever else needs to go here)
              subscriber.posts << post
            end
          rescue ActiveRecord::RecordNotFound
          end
        end
      end
    end
  end

end
