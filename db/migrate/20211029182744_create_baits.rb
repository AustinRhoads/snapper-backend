class CreateBaits < ActiveRecord::Migration[6.1]
  def change
    create_table :baits do |t|
      t.string :name
      t.text :notes

      t.timestamps
    end
  end
end
