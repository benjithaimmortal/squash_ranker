class AthletesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "squashrulez",
      except: [:index, :show, :matchup]


  Elo.configure do |config|

    # Every player starts with a rating of 1000
    config.default_rating = 1000
  
    # A player is considered a pro, when he/she has more than 2400 points
    config.pro_rating_boundry = 2400
  
    # A player is considered a new, when he/she has played less than 30 games
    config.starter_boundry = 30
  
  end

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
    @athlete.rating = Elo::Player.new(:rating => 1000)

    if @athlete.save
      flash.now[:success] = "Player added successfully"
      redirect_to @athlete
    else
      # flash.now[:error] = "Player not added"
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