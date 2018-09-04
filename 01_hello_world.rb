#!/usr/bin/env ruby
require 'twitter' #la base, ligne qui appelle la gem twitter sinon le programme ne saura pas appeler Twitter

# les lignes suivantes enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|
	config.consumer_key        = "A CHANGER"
	config.consumer_secret     = "A CHANGER"
	config.access_token        = "A CHANGER"
	config.access_token_secret = "A CHANGER"
end

#et le premier tweet de la fierté
client.update('Mon premier tweet en ruby, hell yeah !!!! merci @racman !!!')
