class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :titulo
      t.string :imdb

      t.timestamps
    end
  end
end
