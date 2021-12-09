require 'dotenv'
require 'json'
require 'rest-client'
Dotenv.load

class PlayersController < ApplicationController
    before_action :set_player, only: [:show, :edit, :destroy]

    def show
    end

    def create
        @player = Player.new(player_params)
        @team = Team.find(params[:player][:team_id].to_i)
        @player.team = @team
        if find_player(@player).save
            redirect_to root_path()
          else
            render :new
          end
    end

    def edit
    end

    def update
        if @player.update(player_params)
            redirect_to root_path()
          else
            render :edit
          end
    end

    def destroy
        @player.destroy
        redirect_to root_path()
    end

    private

    def set_player
        @player = Player.find(params[:id])
    end

    def player_params
        params.require(:player).permit(:name)
    end

    def find_player(player)
        player = player
        @response =  RestClient.get "https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{player.name}?api_key=RGAPI-aedd82c5-fcc1-476a-9e61-486ba5fbec19",
        {content_type: :json, accept: :json}

        @response =  RestClient.get "https://br1.api.riotgames.com/lol/league/v4/entries/by-summoner/#{JSON.parse(@response.body)["id"]}?api_key=RGAPI-aedd82c5-fcc1-476a-9e61-486ba5fbec19",
        {content_type: :json, accept: :json}
        body = JSON.parse(@response.body)
        
        player.level = set_player_level(body)
        
        return player
    end

    def set_player_level(body)
        body = body

        case body[0]["tier"]
        when "IRON"
            return 1
        when "BRONZE"
            return 2
        when "SILVER"
            return 3
        when "GOLD"
            return 4
        when "PLATINUM"
            return 5
        when "DIAMOND"
            return 6
        when "MASTER"
            return 7
        when "GRANDMASTER"
            return 8
        when "CHALLENGER"
            return 9
        else
            return nil
        end
    end
end
