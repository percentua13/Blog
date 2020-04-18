class CreatePost2tags < ActiveRecord::Migration[6.0]
  def change
    create_table :post2tags, id: false do |t|
      t.references :tag, type: :string, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
    end
  end
end
