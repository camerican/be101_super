class HeroController < ApplicationController

  def index
    @heroes = Hero.all
  end

  def show
    @hero = Hero.find(params[:id])
  end
end
