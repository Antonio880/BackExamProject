class ExamDTO
    attr_reader :id, :category, :question_count, :room_id, :created_by_id, :created_at
  
    def initialize(exam)
      @id = exam.id
      @category = exam.category
      @question_count = exam.question_count
      @room_id = exam.room_id
      @created_by_id = exam.created_by_id
      @created_at = exam.created_at
    end
end