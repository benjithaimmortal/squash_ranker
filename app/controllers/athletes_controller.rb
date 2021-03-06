class AthletesController < ApplicationController
  # makes sort methods accessible for athletes_helper
  helper_method :sort_column, :sort_direction

  # creates a generic admin account for managing the database from the app
  http_basic_authenticate_with name: "admin", password: "squashrulez",
      except: [:index, :show, :matchup, :rating_up, :tossup]

  def index
    @athletes = Athlete.order(sort_column + " " + sort_direction)
  
    # re-runs the rate method to calculate athlete rating
    @athletes.each { |a| rate(a) }
  end

  def matchup
    # choose two athletes at random
    @athletes = Athlete.order("RANDOM()").limit(2)
  end

  def rating_up
    find_athlete
    @athlete.increment! :positive
    @athlete.save
    flash[:notice] = "CLAYTALITY!"
    redirect_to matchup_path
  end

  def tossup
    @athlete_array.each do |a|
      a = Athlete.find(params[:id])
      a.increment! :negative
      a.save
    end
    flash[:notice] = "Whew, nail-biter!"
    redirect_to matchup_path
  end
  
  def show
    find_athlete
    rate(@athlete)
  end

  def create
    @athlete = Athlete.new(athlete_params)
    @athlete.positive ||= 0
    @athlete.negative ||= 0

    if @athlete.save
      flash.now[:notice] = "Player added successfully"
      redirect_to @athlete
    else
      flash.now[:error] = "Player not added"
      render 'create'
    end
  end

  def edit
    find_athlete
  end

  def update
    find_athlete

    # update the rating with edited positive/negative score
    if @athlete.update(athlete_params)
      @athlete.rating = rate(@athlete)
      flash.now[:notice] = "Player added successfully"
      redirect_to @athlete
    else
      render 'edit'
    end
  end

  def destroy
    find_athlete
    @athlete.destroy

    redirect_to athletes_path
  end

  def new
  end

  private

  def athlete_params
    params.require(:athlete).permit(:name, :level, :positive, :negative) if params[:athlete]
  end

  #DRY out commonly typed code
  def find_athlete
    @athlete = Athlete.find(params[:id])
  end

  #upvotes/downvotes rating system
  def rate(athlete)
    positive = athlete.positive
    negative = athlete.negative
    # what I have
    athlete.rating = positive / negative

    # what I want
    # athlete.rating = ((positive + 1.9208) / (positive + negative) - 1.96 * (Math.sqrt((positive * negative) / (positive + negative) + 0.9604) / (positive + negative)) / (1 + 3.8416 / (positive + negative)))
    # athlete.save
  end

  def sort_column
    Athlete.column_names.include?(params[:sort]) ? params[:sort] : "rating"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end