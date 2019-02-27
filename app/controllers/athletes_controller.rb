class AthletesController < ApplicationController
  def create
    @athlete = Athlete.new(athlete_params)
    @athlete.rating ||= 0

    if @athlete.save
      flash[:success] = "Player added successfully"
      redirect_to @athlete
    else
      flash[:error] = "Player not added"
    end
  end

  def index
    @athletes = Athlete.all
  end

  def show
    @athlete = Athlete.find(params[:name])
  end

  def update
    @athlete = Athlete.find(params[:name])
   
    if @athlete.update(athlete_params)
      redirect_to @athlete
    else
      render 'edit'
    end
  end

  def new
  end

    private

    def athlete_params
      params.require(:athlete).permit(:name, :level) if params[:athlete]
    end
  
end
