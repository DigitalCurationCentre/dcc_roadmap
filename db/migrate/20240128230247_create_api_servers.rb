class CreateApiServers < ActiveRecord::Migration[6.1]
  def change
    create_table :api_servers do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
