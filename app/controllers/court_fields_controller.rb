class CourtFieldsController < ApplicationController

  def index
    @courts = CourtFields.all
  end

  def populate
    @courts = CourtField.all
     respond_to do |format|
       format.html{
           render json: {:courts => @courts}
       }
       format.js {}
       format.json {
          render json: {:courts => @courts}
       }
     end
   end

end
