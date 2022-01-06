class FavoritesController < ApplicationController
    before_action :set_favorite, only: [:edit, :destroy]

    def create
        @favorite = Favorite.new()
        @favorite.team = Team.find(params[:favorite][:team].to_i)
        @favorite.user = current_user
        @favorite.save if check_fav()
        redirect_to search_team_path()
    end
  
    def destroy
      @favorite.destroy
      redirect_to search_team_path()
    end
  
    private
  
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    def check_fav
        Favorite.all.each do |favorite|
            return false if favorite.user_id == @favorite.user_id && favorite.team_id == @favorite.team_id
        end
        return true
    end
end
