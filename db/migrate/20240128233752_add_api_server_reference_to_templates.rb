class AddApiServerReferenceToTemplates < ActiveRecord::Migration[6.1]
  def change
    add_reference :templates, :api_servers, foreign_key: true
  end
end
