class ExamResultsController < ApplicationController
    before_action :authenticate_request!

    def submit
        exam_result = ExamResult.create!(
          exam_id: params[:exam_id],
          user_id: params[:user_id],
          score: params[:score],
          total_questions: params[:total_questions]
        )
    
        if exam_result.persisted?
          render json: exam_result
        else
          render json: { error: 'Erro ao salvar o resultado do exame' }, status: :unprocessable_entity
        end
    end
end
