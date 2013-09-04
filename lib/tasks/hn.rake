namespace :hn do
  desc "Queues up the ScrapeRecent job"
  task scrape_recent: :environment do
  	Resque.enqueue(ScrapeRecent)
  end

  desc "Updates a single post from HN"
  task scrape_single: :environment do
  	x = 1
  	Resque.enqueue(UpdateSinglePost, x)
  end
end
