class AthletesController < ApplicationController
  def create
    @athlete = Athlete.new
    @athlete.rating ||= 0
  end

  # def new
  #   @athlete = Athlete.new(athlete_params)
  #   if @athlete.save
  #     flash[:success] = "Player added successfully"
  #   else
  #     render 'view'
  #   end
  # end

  #   private

  #   def athlete_params
  #     params.require(:athlete).permit(:name, :level)
  #   end
  
  def view
    @athletes = Athlete.all
  end
end
