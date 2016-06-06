class CreateTours < ActiveRecord::Migration
  def change
    create_table :tours do |t|
      t.string :title
      t.text :description
      t.date :date
      t.decimal :price
      t.string :place

      t.timestamps null: false
    end
  end
end
