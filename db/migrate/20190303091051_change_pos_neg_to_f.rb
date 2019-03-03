class ChangePosNegToF < ActiveRecord::Migration[5.2]
  def up
    change_column :athletes, :negative, :float
    change_column :athletes, :positive, :float
    change_column :athletes, :rating, :float
  end

  def down
    change_column :athletes, :negative, :integer
    change_column :athletes, :positive, :integer
    change_column :athletes, :rating, :integer
  end
end
