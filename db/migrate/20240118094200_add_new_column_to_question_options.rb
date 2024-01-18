class AddNewColumnToQuestionOptions < ActiveRecord::Migration[6.1]
  def change
    add_column :question_options, :answer_identifer, :string
  end
end
