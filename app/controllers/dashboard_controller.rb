class DashboardController < ApplicationController

  def index

  end
end 


private
def task_params
  params.require(:search).permit(:sport, :neighbourhood)
end
