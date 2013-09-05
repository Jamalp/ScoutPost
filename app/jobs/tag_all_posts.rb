class TagAllPosts
  @queue = :default

  def self.perform
    tags = Tag.all
    tags.each do |tag|
      posts = Post.search(tag.name)
      posts.each do |post|
        begin
        post.tags << tag
        rescue ActiveRecord::RecordNotUnique
        end
      end
    end
  end
end