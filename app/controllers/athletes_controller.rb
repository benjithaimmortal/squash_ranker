class AthletesController < ApplicationController
  def create
    @athlete = Athlete.new
    @athlete.rating ||= 0
  end

  def view
    @athletes = Athlete.all
      # @athlete_table = Athlete.group(:name)
      # puts @athlete_table
      # @athlete.each { |x| puts (x.name + " " + x.level + " " + x.rating) }
  end
end
