class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.string :address
      t.string :state
      t.string :city
      t.string :zip_code
      t.integer :water_body_class

      t.timestamps
    end
  end
end
