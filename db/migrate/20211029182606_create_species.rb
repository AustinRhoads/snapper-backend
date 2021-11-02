class CreateSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :species do |t|
      t.string :scientific_name
      t.text :description
      t.string :name

      t.timestamps
    end
  end
end
