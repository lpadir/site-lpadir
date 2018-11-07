class CreateEntradas < ActiveRecord::Migration
  def change
    create_table :entradas do |t|
      t.integer :usuario_id
      t.integer :porta_id
      t.timestamps
    end
  end
end
