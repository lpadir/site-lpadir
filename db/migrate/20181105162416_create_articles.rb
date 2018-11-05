class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string:titulo
      t.string:descricao
      t.timestamps
    end
  end
end
