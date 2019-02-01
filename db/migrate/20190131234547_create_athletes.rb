class CreateAthletes < ActiveRecord::Migration[5.2]
  def change
    create_table :athletes do |t|
      t.string :name
      t.integer :level
      t.integer :rating

      t.timestamps
    end
  end
end
