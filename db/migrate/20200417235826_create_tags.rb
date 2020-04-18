class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags, id: false do |t|
      t.string :id, primary_key: true

    end
  end
end
