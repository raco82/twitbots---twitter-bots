#!/usr/bin/env ruby
require 'twitter' #la base, ligne qui appelle la gem twitter sinon le programme ne saura pas appeler Twitter

# les lignes suivantes enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|
	config.consumer_key        = "A CHANGER"
	config.consumer_secret     = "A CHANGER"
	config.access_token        = "A CHANGER"
	config.access_token_secret = "A CHANGER"
end

	#liste des topics recherchés
	topics = ["coffee", "tea", "aixit", "hdj"]
	client.filter(track: topics.join(",")) do |object|
		
	#on puts, les résultats apparaissent en temps réel, c'est beau comme dans matrix
	puts object.text if object.is_a?(Twitter::Tweet)
end
