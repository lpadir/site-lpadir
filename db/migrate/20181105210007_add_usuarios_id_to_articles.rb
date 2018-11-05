class AddUsuariosIdToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :usuario_id, :integer
  end
end
