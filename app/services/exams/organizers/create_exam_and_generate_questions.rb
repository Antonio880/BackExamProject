module Exams
    module Organizers
        class CreateExamAndGenerateQuestions
            include Interactor::Organizer
    
            organize CreateExam, GenerateQuestions, SaveGeneratedQuestions
        end
    end
end