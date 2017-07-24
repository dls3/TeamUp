class SearchController < ApplicationController
  def index
  end

  def index
    @games = Game.search(params[:game])
  end
end


private
def task_params
  params.require(:game).permit(:sport, :neighbourhood)
end
