class AddNewColumnToOrgs < ActiveRecord::Migration[6.1]
  def change
    add_column :orgs, :add_question_identifiers, :boolean
  end
end
