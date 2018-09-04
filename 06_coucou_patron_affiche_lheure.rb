#!/usr/bin/env ruby
require 'twitter' #la base, ligne qui appelle la gem twitter sinon le programme ne saura pas appeler Twitter

# les lignes suivantes enregistrent les clés d'APIs
client = Twitter::REST::Client.new do |config|
	config.consumer_key        = "A CHANGER"
	config.consumer_secret     = "A CHANGER"
	config.access_token        = "A CHANGER"
	config.access_token_secret = "A CHANGER"
end

loop do #ptite boucle qui part de là
	minuteur = 0 #on initialise un minuteur
	time = Time.new #on initialise l'heure
	unless minuteur > 600 #on fait tourner le bordel pendant une heure
	client.update("@racman Salut mon poulet, c'est juste pour te dire qu'il est " + time.hour.to_s + "h" + time.min.to_s) #petit message bien relou qui envoi l'heure à tonton Racö
	minuteur += 1 #ajoute 1 au compteur dans le minuteur
	puts "heure envoyé, Racö doit être bien énervé!" #affiche dans la console ce qui se passe
	sleep 60 #pause 60 secondes entre 2 messages (attention, ça va fonctionner quelques minutes puis Twitter va bloquer l'appli pour cause de spam, changer les paramêtres pour rentrer dans les clous les loulous ;))
end

end
