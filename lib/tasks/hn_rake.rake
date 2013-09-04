require 'rubygems'
require 'json'
require 'ruby-hackernews'
include RubyHackernews

namespace :hn_rake do
  task posts: :environment do
    # Query hackernews with entry.all
    # store each returned entry as a post
    Entry.all(1).each do |post|
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
