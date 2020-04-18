class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors, id: false do |t|
      t.primary_key :id
      t.string :name, null: false
      t.string :surname, null: false
      t.string :username, null: false
      t.string :email, null: false
      t.string :password, null: false
      t.text :media, null: false
      t.text :about

    end
  end
end
