#!/usr/bin/env ruby
require 'twitter' #la base, ligne qui appelle la gem twitter sinon le programme ne saura pas appeler Twitter

while true
	begin
		config = {# les lignes suivantes enregistrent les clés d'APIs
	  	consumer_key:			'A CHANGER',
	  	consumer_secret: 		'A CHANGER',
	  	access_token: 			'A CHANGER',
	  	access_token_secret: 	'A CHANGER'
		}

		rClient = Twitter::REST::Client.new config
		sClient = Twitter::Streaming::Client.new(config)

		# liste des sujets
		topics = ['#marseille', '#hdj', '#aixit, #chattons']
		sClient.filter(:track => topics.join(',')) do |tweet|
		if tweet.is_a?(Twitter::Tweet)
	      	puts tweet.text 
	      	rClient.fav tweet
	    end
	end
	#On pose une limite de temps entre les requêtes pour respecter la charte Twitter
    	rescue #on esquive les bans sinon sans ça on se fait griller par l'oiseau
      puts 'error occurred, sleeping for 5 seconds'
      sleep 5
    end
end
