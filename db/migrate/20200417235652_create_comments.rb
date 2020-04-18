class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments, id: false do |t|
      t.primary_key :id
      t.text :body, null: false
      t.datetime :dateTime, null: false
      t.references :author, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

    end
  end
end
