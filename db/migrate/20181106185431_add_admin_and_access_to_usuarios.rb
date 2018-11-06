class AddAdminAndAccessToUsuarios < ActiveRecord::Migration
  def change
    add_column :usuarios, :admin, :boolean, default: false
    add_column :usuarios, :acesso_lab, :boolean, default: false
  end
end
