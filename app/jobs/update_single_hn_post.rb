# BE CAREFUL ABOUT THE PARAMETERS. KEEP BELOW 3
# WILL BE BANNED IF ABOVE 5 (300 Hits)

# Resque.enqueue(UpdateSinglePost, single_post_id)
class UpdateSinglePost
  @queue = :default

  def self.perform(post_id)
    post = Post.find(post_id)
  	puts "Updating #{post.title}"
    old_score = post.score
    updated_entry = Entry.find(post.hn_post_id)
    post.score = updated_entry.voting.score
    post.save
    puts "Prior Score: #{old_score}, New Score: #{post.score}"
  end
end