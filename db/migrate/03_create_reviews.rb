class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :restaurant
      t.belongs_to :user
      t.integer :rating
      t.text :content
      t.date :date

    end
  end
end
