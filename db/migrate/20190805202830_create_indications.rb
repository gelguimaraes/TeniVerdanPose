class CreateIndications < ActiveRecord::Migration[5.2]
  def change
    create_table :indications do |t|
      t.integer :movie_id
      t.integer :plataform_id
      t.references :user_indicator
      t.references :user_indicated
      t.references :movie, foreign_key: true
      t.references :plataform, foreign_key: true

      t.timestamps
    end
    add_foreign_key :indications, :users, column: :user_indicator_id, primary_key: :id
    add_foreign_key :indications, :users, column: :user_indicated_id, primary_key: :id
  end
end
