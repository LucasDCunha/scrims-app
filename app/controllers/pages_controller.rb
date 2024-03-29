class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @scrim = Scrim.new
    @scrims = Scrim.all
    @teams = Team.all.select {|t|t.user == current_user}
    @elos = {
      'FERRO' => 1, 'BRONZE' => 2, 'PRATA' => 3, 'OURO' => 4, 'PLATINA' => 5,
      'DIAMANTE' => 6,'MESTRE' => 7, 'GRÃO-MESTRE' => 8, 'DESAFIANTE' => 9
      }
  end
end
