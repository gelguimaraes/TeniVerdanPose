class CreateIndications < ActiveRecord::Migration[5.2]
  def change
    create_table :indications do |t|

      t.integer :user_id
      t.integer :movie_id
      t.integer :plataform_id
      t.references :user, foreign_key: true
      t.references :movie, foreign_key: true
      t.references :plataform, foreign_key: true

      t.timestamps
    end
  end
end
