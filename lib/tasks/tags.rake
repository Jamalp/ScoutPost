namespace :tags do
  desc "Queues tagging of all the posts"
  task tag_all_posts: :environment do
    Resque.enqueue(TagAllPosts)
  end
end