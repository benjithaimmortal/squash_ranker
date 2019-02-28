class AddNegativeToAthletes < ActiveRecord::Migration[5.2]
  def change
    add_column :athletes, :negative, :integer
  end
end
