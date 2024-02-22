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

  validate :value_unique_within_template
  
  validate :name_unique_within_template
  
# ===========================
# = Private instance methods =
# ===========================  
private

def value_unique_within_template
  template_id = question.section.phase.template_id 
  if QuestionIdentifier.exists?(value: value, question_id: question_id, question: Question.where(section: Section.where(phase: Phase.where(template_id: template_id))))
    errors.add('', UNIQUENESS_MESSAGE)
  end
end

def name_unique_within_template
  template_id = question.section.phase.template_id 
  if QuestionIdentifier.exists?(name: name, question_id: question_id, question: Question.where(section: Section.where(phase: Phase.where(template_id: template_id))))
    errors.add('',UNIQUENESS_MESSAGE)
  end
end


end
  