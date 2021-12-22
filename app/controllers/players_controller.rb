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
        return redirect_to edit_team_path(@team) if find_player(@player) == nil
        if find_player(@player).save
            redirect_to edit_team_path(@team)
          else
            render :new
          end
    end

    def edit
    end

    def update
        @team = @player.team
        if @player.update(player_params)
            redirect_to edit_team_path(@team)
          else
            render :edit
          end
    end

    def destroy
        @team = @player.team
        @player.destroy
        redirect_to edit_team_path(@team)
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
        begin
            r =  RestClient.get "https://br1.api.riotgames.com/lol/summoner/v4/summoners/by-name/#{player.name}?api_key=RGAPI-aedd82c5-fcc1-476a-9e61-486ba5fbec19",
            {content_type: :json, accept: :json}
        rescue => exception
            return nil
        end
        r =  RestClient.get "https://br1.api.riotgames.com/lol/league/v4/entries/by-summoner/#{JSON.parse(r.body)["id"]}?api_key=RGAPI-aedd82c5-fcc1-476a-9e61-486ba5fbec19",
        {content_type: :json, accept: :json}
        body = JSON.parse(r.body)
        if body == []
            player.level = 0
            return player
        end
        set_player_level(body) != nil ? player.level = set_player_level(body) : player.level = 0
            
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
