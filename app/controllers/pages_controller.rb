class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home

  def home
    @scrim = Scrim.new
    @scrims = Scrim.all
    @teams = Team.all.select {|t|t.user == current_user}
  end
end
