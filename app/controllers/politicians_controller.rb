class PoliticiansController < ApplicationController

  def show
    @politician = Politician.find_by(id: params[:id])

    client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "FItvkTJndpOawAnm6RtrxYVT7"
    config.consumer_secret     = "Y0neV0epRp2AEtjyK4z3k6R397PeLyypnxuuXLc4jEF1pInvEw"
    config.access_token        = "281426689-n5SEh2TFZPAMnxlD76nmRkGBxHtgaDQVm95CphGa"
    config.access_token_secret = "2pHmgkR0UIBR4EwdRQLidy511fvnL3qcgxtGHtHq807Gl"
    end

    # client = Twitter::REST::Client.new do |config|
    # config.consumer_key        = TWITTER_CONSUMER_KEY
    # config.consumer_secret     = TWITTER_CONSUMER_SECRET
    # config.access_token        = TWITTER_ACCESS_TOKEN
    # config.access_token_secret = TWITTER_ACCESS_TOKEN_SECRET
    # end

    ## The 2 methods we use to parse all 3200 tweets. But the load time will be long, so for now, we're only parsing 40.

    # def collect_with_max_id(collection=[], max_id=nil, &block)
    #   response = yield(max_id)
    #   collection += response
    #   response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
    # end

    # def client.get_all_tweets(user)
    #   collect_with_max_id do |max_id|
    #   options = {count: 200, include_rts: true}
    #   options[:max_id] = max_id unless max_id.nil?
    #   user_timeline(user, options)
    #   end
    # end

    def client.get_all_tweets(politician)
      options = {:count => 40, :include_rts => true}
      user_timeline(politician, options)
    end

    @tweets = client.get_all_tweets(@politician.twitter_handle)

  end


end

