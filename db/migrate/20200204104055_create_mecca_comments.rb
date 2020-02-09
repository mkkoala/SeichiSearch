class CreateMeccaComments < ActiveRecord::Migration[5.2]
  def change
    create_table :mecca_comments do |t|
      t.references :user, null:false #外部キー
      t.references :mecca, null:false #外部キー
      t.text :comment
      t.timestamps null: false
    end
  end
end
