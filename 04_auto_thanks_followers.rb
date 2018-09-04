#!/usr/bin/env ruby
require 'twitter' #la base, ligne qui appelle la gem twitter sinon le programme ne saura pas appeler Twitter

# les lignes suivantes enregistrent les clés d'APIs
config =
	{
    consumer_key:        'A CHANGER',
    consumer_secret:     'A CHANGER',
    access_token:        'A CHANGER',
    access_token_secret: 'A CHANGER'
	}

me = 'ACHANGER' #Mon Username

Thread.new do
  loop do
    begin
      rClient = Twitter::REST::Client.new config
      sClient = Twitter::Streaming::Client.new(config)
      sClient.user do |object|
          #Si une nouvelle personne vous suit
            if object.is_a? Twitter::Streaming::Event and object.name==:follow
              user = object.source
            if user.name != me
              rClient.create_direct_message user, "Merci de me suivre #{user.name} :)"
            puts "Nouveau follower : #{object.source.name}"
            end
      end
      end

    rescue #on esquive les bans sinon sans ça on se fait griller par l'oiseau
      puts 'error occurred, sleeping for 5 seconds'
      sleep 5
    end
  end
end
