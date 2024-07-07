module Exams
    module Organizers
        class CreateExamAndGenerateQuestions
            include Interactor::Organizer
    
            organize( 
                Exams::Interactors::CreateExam, 
                Exams::Interactors::GenerateQuestions, 
                Exams::Interactors::SaveGeneratedQuestions 
            )
        end
    end
end