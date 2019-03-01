module AthletesHelper

  # Makes sortable columns in table views. Provide the column's name as a string.
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}
  end

  # Raises positive rating by 1
  def rating_up(athlete)
    athlete.positive += 1
  end

  # Raises negative rating by 1
  def rating_down(athlete)
    athlete.negative += 1
  end
end
