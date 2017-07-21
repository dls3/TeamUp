class DashboardController < ApplicationController

  def index
    @courts = CourtField.all
    @court = CourtField.new
  end

  def create
    @court = CourtField.new

    if request.xhr?
        respond_to do |format|
          format.html do
            if @court.save
              render partial: 'court', locals: {court: @court}
            end
          end

    format.json do
          if @court.save
            render :json => @court
          end
        end
  end



end
