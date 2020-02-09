class CreateMeccasMovieTags < ActiveRecord::Migration[5.2]
  def change
    create_table :meccas_movie_tags do |t|
      t.references :movie_tag, null:false #外部キー
      t.references :mecca, null:false #外部キー
      t.timestamps null: false
    end
  end
end
