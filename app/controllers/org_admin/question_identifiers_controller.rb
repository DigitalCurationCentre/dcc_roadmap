# frozen_string_literal: true

module OrgAdmin
    # Controller that handles question identifiers
    class QuestionIdentifiersController < ApplicationController
        include QuestionIdentifiersHelper

        # Code to generate the list of Question Identifiers
        def list
            #Get the template
            question_identifier = QuestionIdentifier.find(params[:id])
            template = Template.find(question_identifier.question.section.phase.template_id)
        
        
            render json: {
              'question_identifier' => {
                'id' => user.id,
                'html' => render_to_string(partial: 'org_admin/question_identifiers/_question_identifiers_list',
                                           locals: { template: template },
                                           formats: [:html])
              }
            }.to_json
        end    

        # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        def destroy
            question_identifier = QuestionIdentifier.find(params[:id])
            question_identifier_id_to_remove = question_identifier.id.to_s
            authorize question_identifier
            question = question_identifier.question
            section = question.section
            phase = section.phase
            begin
                question_identifier = get_modifiable(question_identifier)
                question = question_identifier.question
                section = question.section
                phase = section.phase

                if question_identifier.destroy
                 flash[:notice] = success_message(question_identifier, _('deleted'))
                else
                 flash[:alert] = flash[:alert] = failure_message(question_identifier, _('delete'))
                end
            rescue StandardError
                flash[:alert] = _('Unable to delete the question identifier pair for question number %{question_number}') % {question_number: question.number}
            end

            redirect_to edit_org_admin_template_phase_path(
                template_id: question_identifier.question.section.phase.template.id,
                id: question_identifier.question.section.phase.id,
                section: question_identifier.question.section.id
            )
            
        end
        # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
    
    end
end