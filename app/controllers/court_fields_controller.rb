class CourtFieldsController < ApplicationController

  def import
    CourtField.import(params[:file])
    redirect_to root_url, notice: "Tennis courts imported"
  end

end
