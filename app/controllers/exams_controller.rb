class ExamsController < ApplicationController
    def create
      result = Exams::CreateExamAndGenerateQuestions.call(
        category: params[:category],
        question_count: params[:question_count],
        room_id: params[:room_id],
        created_by_id: params[:created_by_id],
        limit: params[:question_count]
      )
  
      if result.success?
        render json: result.exam, status: :created
      else
        render json: { error: result.error }, status: :unprocessable_entity
      end
    end
  
    def generate_questions
      result = Exams::GenerateQuestions.call(category: params[:category], limit: params[:limit])
  
      if result.success?
        render json: result.questions
      else
        render json: { error: result.error }, status: :unprocessable_entity
      end
    end
  
    def submit
      result = Exams::EvaluateExam.call(exam_id: params[:exam_id], answers: params[:answers])
  
      if result.success?
        render json: result.exam_result
      else
        render json: { error: result.error }, status: :unprocessable_entity
      end
    end
  end
  