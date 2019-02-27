class AthletesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "squashrulez",
      except: [:index, :show, :matchup]

  def index
    @athletes = Athlete.all
  end

  #check out that PG!
  def matchup
    @athletes = Athlete.order("RANDOM()").limit(2)
    @player1 = @athletes[0]
    @player2 = @athletes[1]


  end

  def show
    @athlete = Athlete.find(params[:id])
  end

  def create
    @athlete = Athlete.new(athlete_params)
    @athlete.rating ||= Elo::Player.new

    if @athlete.save
      flash[:success] = "Player added successfully"
      redirect_to @athlete
    else
      flash[:error] = "Player not added"
      render 'create'
    end
  end

  def edit
    @athlete = Athlete.find(params[:id])
  end

  def update
    @athlete = Athlete.find(params[:id])
   
    if @athlete.update(athlete_params)
      redirect_to @athlete
    else
      render 'edit'
    end
  end

  def destroy
    @athlete = Athlete.find(params[:id])
    @athlete.destroy

    redirect_to athletes_path
  end

  def new
  end

  private

  def athlete_params
    params.require(:athlete).permit(:name, :level) if params[:athlete]
  end
end