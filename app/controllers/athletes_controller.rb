class AthletesController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "squashrulez",
      except: [:index, :show, :matchup]
  

  def index
    @athletes = Athlete.order(:rating, :name).all
    @athletes.each { |a| rate(a) }
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
    @athlete.positive ||= 0
    @athlete.negative ||= 0
    @athlete.rating = rate(@athlete)


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
    @athlete.rating = rate(@athlete)
   
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
    params.require(:athlete).permit(:name, :level, :positive, :negative, :rating) if params[:athlete]
  end


  #upvotes/downvotes rating system
  def rate(athlete)
    positive = athlete.positive
    negative = athlete.negative
    athlete.rating = (positive - negative)
    
    # ((positive + 1.9208) / (positive + negative) - 1.96 * Math.sqrt((positive * negative) / (positive + negative) + 0.9604) / (positive + negative)) / (1 + 3.8416 / (positive + negative))
  end
end