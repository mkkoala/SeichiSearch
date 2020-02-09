class CreateMovieTags < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_tags do |t|
      t.string :title
      t.string :movie_image_id
      t.text :body
      t.integer :user_id

      t.timestamps
    end
  end
end
