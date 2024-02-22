# frozen_string_literal: true

module OrgAdmin
    # Controller that handles question identifiers
    class QuestionIdentifiersController < ApplicationController
        include QuestionIdentifiersHelper

        # Code to generate the list of Question Identifiers
        def list
            #returns html list of Question Identifiers for the template
            template = Template.find(params[:id])
            html = template.html_question_identifiers_list(template.id)
        
            render json: {
                success: true, 
                html: html
            } 
        end    

        # PDF export question identifiers list  
        def export_pdf_list
              #returns html list of Question Identifiers for the template
            question = Question.find(params[:id])
            template = question.template
            @html_object = template.html_question_identifiers_list(template.id)
            
            pdf = WickedPdf.new.pdf_from_string(@html_object)
          
            send_data pdf, filename: "question_identifiers_list.pdf", type: "application/pdf", disposition: "attachment"
             

            
          end


        # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
        def destroy
            question_identifier = QuestionIdentifier.find(params[:id])

            authorize question_identifier

            question = question_identifier.question

            
            if question_identifier.destroy
                flash[:notice] = success_message(question_identifier, _('deleted'))
            else
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