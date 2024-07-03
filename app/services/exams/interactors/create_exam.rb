module Exams
  module Interactors
    class CreateExam
      include Interactor
  
      def call
        exam = Exam.new(exam_params)
        room = Room.find(context.room_id)
        created_by = User.find(context.created_by_id)
  
        exam.room = room
        exam.created_by = created_by
  
        if exam.save
          context.exam = exam
        else
          context.fail!(error: exam.errors.full_messages.join(', '))
        end
      end
  
      private
  
      def exam_params
        {
          category: context.category,
          question_count: context.question_count
        }
      end
    end
  end
end
  