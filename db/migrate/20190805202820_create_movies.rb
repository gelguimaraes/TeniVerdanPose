class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :titulo
      t.string :imdb
      t.string :poster
      t.string :ano
      t.string :nota
      t.string :genero
      t.timestamps
    end
  end
end

