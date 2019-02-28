class AddPositiveToAthletes < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :positive, :integer
  end
end
