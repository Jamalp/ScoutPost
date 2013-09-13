class TagSinglePost
  @queue = :default

  def self.perform(post_id)
    tags = Tag.all
    tags.each do |tag|
      posts = Post.where(id: post_id).search(tag.name)
      posts.each do |post|
        begin
        post.tags << tag
        Resque.enqueue(CheckSubscriberPost, post.id)
        rescue ActiveRecord::RecordNotUnique
        end
      end
    end
  end
end