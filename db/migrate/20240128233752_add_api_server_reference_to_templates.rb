class AddApiServerReferenceToTemplates < ActiveRecord::Migration[6.1]
  def change
    add_column :templates, :api_servers, :foreign_key
  end
end
