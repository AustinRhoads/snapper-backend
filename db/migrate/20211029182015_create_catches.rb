class CreateCatches < ActiveRecord::Migration[6.1]
  def change
    create_table :catches do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :size
      t.string :address
      t.decimal :lat
      t.decimal :lng
      t.datetime :date
      t.text :notes

      t.timestamps
    end
  end
end
