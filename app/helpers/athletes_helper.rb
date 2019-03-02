module AthletesHelper

  # Makes sortable columns in table views. Provide the column's name as a string.
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}
  end

  # # Raises positive rating by 1
  # def rating_up(athlete, name = nil)
  #   name ||= name.titleize
  #   athlete.increment_counter(:positive)
  #   athlete.save
  # end

  # Raises negative rating by 1
  # def rating_down(athletes, name = nil)
  #   name ||= name.titleize
  #   athletes.each do |a|
  #     a.increment(:negative)
  #     a.save
  #   end
  # end
end