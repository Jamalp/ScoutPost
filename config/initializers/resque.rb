$redis = Redis.new(host: ENV["REDISCLOUD_URL"] || 'localhost:6379')
Resque.redis = $redis
# We'll set config parameters on Redis soon