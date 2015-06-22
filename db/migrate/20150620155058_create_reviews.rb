class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :console
      t.text :body
      t.string :ratings

      t.timestamps null: false
    end
  end
end
