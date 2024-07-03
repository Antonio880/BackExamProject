module Exams
  module Interactors
    class EvaluateExam
      include Interactor
  
      def call
        exam = Exam.find(context.exam_id)
        questions = exam.questions
  
        correct_answers = 0
        incorrect_answers = 0
  
        context.answers.each do |answer|
          question = questions.find { |q| q.id == answer[:question_id] }
          correct_answer_key = question.correct_answers.key(true)
  
          if correct_answer_key == answer[:selected_answer]
            correct_answers += 1
          else
            incorrect_answers += 1
          end
        end
  
        context.exam_result = {
          total_questions: questions.size,
          correct_answers: correct_answers,
          incorrect_answers: incorrect_answers
        }
      end
    end
  end
end
  