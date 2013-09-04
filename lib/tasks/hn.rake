namespace :hn do
  desc "Queues up the ScrapeRecent job"
  task scrape_recent: :environment do
  	Resque.enqueue(ScrapeRecent)
  end
end
