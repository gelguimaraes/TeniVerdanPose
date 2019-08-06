class CreatePlataforms < ActiveRecord::Migration[5.2]
  def change
    create_table :plataforms do |t|
      t.string :nome
      t.string :image

      t.timestamps
    end
  end
end
