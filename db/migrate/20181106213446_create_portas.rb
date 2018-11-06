class CreatePortas < ActiveRecord::Migration
  def change
    create_table :portas do |t|
      t.string :local
      t.string :comodo
      t.string :criado_por
      t.timestamps
    end
  end
end
