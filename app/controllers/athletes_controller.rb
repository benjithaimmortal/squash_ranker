class AthletesController < ApplicationController
  # makes sort methods accessible for athletes_helper
  helper_method :sort_column, :sort_direction

  # creates a generic admin account for managing the database from the app
  http_basic_authenticate_with name: "admin", password: "squashrulez",
      except: [:index, :show, :matchup]

  def index
    @athletes = Athlete.order(sort_column + " " + sort_direction)
  
    # re-runs the rate method to calculate athlete rating
    @athletes.each { |a| rate(a) }
  end

  #check out that PG!
  def matchup
    # choose two athletes at random
    @athletes = Athlete.order("RANDOM()").limit(2)
  end  

  def show
    @athlete = Athlete.find(params[:id])
    rate(@athlete)
  end

  def create
    @athlete = Athlete.new(athlete_params)
    @athlete.positive ||= 0
    @athlete.negative ||= 0

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

    # update the rating with edited positive/negative score
    if @athlete.update(athlete_params)
      @athlete.rating = rate(@athlete)
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

  def rating_up(a)
    a.increment_counter(:positive)
    a.save
    redirect_back(matchup_path)
  end


  private

  def athlete_params
    params.require(:athlete).permit(:name, :level, :positive, :negative) if params[:athlete]
  end

  #upvotes/downvotes rating system
  def rate(athlete)
    positive = athlete.positive
    negative = athlete.negative
    if athlete.negative == 0
      athlete.rating == athlete.positive
    else
      athlete.rating = (positive / negative)
    end
    # ((positive + 1.9208) / (positive + negative) - 1.96 * Math.sqrt((positive * negative) / (positive + negative) + 0.9604) / (positive + negative)) / (1 + 3.8416 / (positive + negative))
  end

  def sort_column
    Athlete.column_names.include?(params[:sort]) ? params[:sort] : "rating"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end