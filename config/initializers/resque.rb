require 'uri'
uri = URI.parse(ENV["REDISCLOUD_URL"])
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)
Resque.redis = $redis
# We'll set config parameters on Redis soon