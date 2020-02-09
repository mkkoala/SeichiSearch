class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, null:false #外部キー
      t.references :mecca, null:false #外部キー
      t.timestamps null: false
    end
  end
end
