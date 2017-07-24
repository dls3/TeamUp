class CourtFieldsController < ApplicationController

  def index
    @courts = CourtFields.all
  end

  def populate
    respond_to do |format|
      format.json do
      @courts = CourtFields.all
      render json: @courts, include: :name, :address, :neighbourhood, :lat, :long
      end
    end
  end

end
