class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts, id: false do |t|
      t.primary_key :id
      t.text :body
      t.text :media, null: false
      t.datetime :dateTime, null: false
      t.references :author, null: false, foreign_key: true

    end
  end
end
