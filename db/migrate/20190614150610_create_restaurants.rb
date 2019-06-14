class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :street_address
      t.string :genre
      t.belongs_to :city, foreign_key: true

      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
