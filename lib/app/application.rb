require_relative './../views/show'
require_relative 'game'
require 'objspace'

#game = Game.new
#game.creation_players
#game.first_player_to_play?
#game.launch

#$:.unshift File.expand_path("./lib", __FILE__)
#require 'controller'

class Application

  def initialize
    @game =  Game.new
    @show = Show.new
  end #ainsi, un "Router.new" lancé par app.rb va créer automatique une instance "@controller"

  def perform #rappelle-toi que l'on fait "Router.new.perform" dans app.rb => après initialize, on définit perform.
    puts "BIENVENUE DANS THE GOSSIP PROJECT"
    player_1 = @show.player_inscription_1
    player_2 = @show.player_inscription_2
    @game.launch(player_1, player_2)
    while true
      #on affiche le menu
      puts "Tu veux faire quoi BG ?"
      puts "1. New Day, New Hope : une partie"
      puts "2. Rage Quit ! C'est la faute à la manette"
      params = gets.chomp.to_i #on attend le choix de l'utilisateur

      case params #en fonction du choix
      when 1
      	GarbageCollector.new.delete_all_objects
        @game.launch(player_1, player_2)
      when 2
        puts "Ha ha ! See you soon, space loser !"
        break
      else
        puts "Europe, Wrong number"
      end
     end
   end
end