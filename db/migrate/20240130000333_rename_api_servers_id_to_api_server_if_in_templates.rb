class RenameApiServersIdToApiServerIfInTemplates < ActiveRecord::Migration[6.1]
  def change
    rename_column :templates, :api_servers_id, :api_server_id
  end
end
