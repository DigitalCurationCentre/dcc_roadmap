# frozen_string_literal: true

# == Schema Information
#
# Table name: question_identifiers
#
#  id           :integer          not null, primary key
#  question_id  :integer
#  value        :string
#  name         :string           
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Foreign Keys
#
#  fk_rails_...  (question_id => questions.id)
#

# Object that represents a question identifier 
class QuestionIdentifier < ApplicationRecord
  # ================
  # = Associations =
  # ================

  belongs_to :question
  
  # ===============
  # = Validations =
  # ===============

  validates :name, presence: { message: PRESENCE_MESSAGE }
                                  
  validates :value, presence: { message: PRESENCE_MESSAGE }
   
end
  