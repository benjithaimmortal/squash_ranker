module AthletesHelper

  # Makes sortable columns in table views. Provide the column's name as a string.
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}
  end
end