class CreatePortas < ActiveRecord::Migration
  def change
    create_table :portas do |t|
      t.string :local
      t.string :comodo
      t.timestamps
    end
  end
end
