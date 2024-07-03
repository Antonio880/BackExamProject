class ExamResultDTO
    attr_reader :total_questions, :correct_answers, :incorrect_answers
  
    def initialize(total_questions, correct_answers, incorrect_answers)
      @total_questions = total_questions
      @correct_answers = correct_answers
      @incorrect_answers = incorrect_answers
    end
end
  