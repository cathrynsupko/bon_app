class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :review_author_id
      t.integer :reviewed_post_id
      t.integer :rating
      t.string :content

      t.timestamps null: false
    end
  end
end
