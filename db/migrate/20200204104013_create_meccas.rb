class CreateMeccas < ActiveRecord::Migration[5.2]
  def change
    create_table :meccas do |t|
      t.integer :user_id
      t.string :name
      t.text :body
      t.string :mecca_image_id
      t.string :post_code
      t.string :address

      t.timestamps
    end
  end
end
