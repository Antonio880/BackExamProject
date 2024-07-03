module Exams
  module Interactors
    class SaveGeneratedQuestions
      include Interactor
  
      def call
        exam = Exam.find(context.exam_id)
        questions = context.questions.map do |q|
          ExamQuestion.new(
            exam: exam,
            question: q[:question],
            description: q[:description],
            answers: q[:answers],
            correct_answers: q[:correct_answers].transform_values(&:to_boolean),
            multiple_correct_answers: q[:multiple_correct_answers],
            correct_answer: q[:correct_answer],
            explanation: q[:explanation],
            tip: q[:tip],
            category: q[:category],
            difficulty: q[:difficulty]
          )
        end
  
        if questions.all?(&:save)
          context.exam_questions = questions
        else
          context.fail!(error: questions.map(&:errors).map(&:full_messages).flatten.join(', '))
        end
      end
    end
  end
end
  