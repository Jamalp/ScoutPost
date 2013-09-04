class ScrapeRecent
  @queue = :default

  def self.perform
  	puts "Scraping HN"
    Entry.newest(1).each do |post|
    	puts post.link.title
      # BE CAREFUL ABOUT THE PARAMETERS. KEEP BELOW 3
      # WILL BE BANNED IF ABOVE 5 (300 Hits)

      post_data = { title: post.link.title,
                    # description: post_text,
                    # description: post.link.text,
                    # site: post.link.site,
                    href: post.link.href,
                    score: post.voting.score,
                    # user: post.user.name,
                    comments_count: post.comments_count,
                    hn_post_id: post.id,
                    # submission: post.time
                  }
      post = Post.create(post_data)
    end
  end
end