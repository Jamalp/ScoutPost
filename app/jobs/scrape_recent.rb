# BE CAREFUL ABOUT THE PARAMETERS. KEEP BELOW 3
# WILL BE BANNED IF ABOVE 5 (300 Hits)
class ScrapeRecent
  @queue = :default

  def self.perform
  	puts "Scraping HN"
    Entry.newest(1).each do |post|

      if Post.where(hn_post_id: post.id).first
      	break
      else
      	puts "#{post.link.title}, #{post.id}"
	      post_data = { title: post.link.title,
	                    href: post.link.href,
	                    score: post.voting.score,
	                    comments_count: post.comments_count,
	                    hn_post_id: post.id,
                      submission: post.time
	                  }
	      new_post = Post.create(post_data)
        # Resque.enqueue(TagSinglePost, new_post.id)
	    end
    end
  end
end