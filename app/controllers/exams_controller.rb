class ExamsController < ApplicationController
  before_action :authenticate_request!
  before_action :set_exam, only: [:destroy, :get_questions, :check_user_exam]

    # GET /exams
    def index
      @exams = Exam.all
      render json: @exams
    end

    def get_questions
      puts @exam
      if @exam
        
        questions = @exam.exam_questions
        render json: questions
      else
        render json: { error: 'Exam not found' }, status: :not_found
      end
    end
  
    def create
      puts params[:category]
      result = Exams::Organizers::CreateExamAndGenerateQuestions.call(
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

    def check_user_exam
      user_id = params[:user_id]
      exam_result = ExamResult.find_by(user_id: user_id, exam_id: @exam.id)
  
      if exam_result
        render json: { taken: true, score: exam_result.score }
      else
        render json: { taken: false }
      end
    end

    # GET /rooms/created_by/:created_by_id
    def created_by
      puts params[:created_by_id]
      @exams = Exam.where(created_by_id: params[:created_by_id])
      render json: @exams
    end

    # DELETE /exams/:id
    def destroy
      @exam.destroy
    end

    def get_room_exams
      @exams = Exam.where(room_id: params[:room_id])
      render json: @exams
    end
  
    private
    
    def set_exam
      @exam = Exam.find(params[:exam_id])
    end
  end
  