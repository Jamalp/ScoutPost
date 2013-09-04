web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
worker: env QUEUE=* bundle exec resque work