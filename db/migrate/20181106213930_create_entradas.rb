class CreateEntradas < ActiveRecord::Migration
  def change
    create_table :entradas do |t|
      t.string :usuario
      t.string :tipo_entrada
      t.timestamps
    end
  end
end
