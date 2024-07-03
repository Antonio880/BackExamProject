module Exams
    module Interactors
      class GenerateQuestions
        include Interactor

        def call
          url = "https://quizapi.io/api/v1/questions?apiKey=#{ENV['QUIZ_API_KEY']}&category=#{context.category}&limit=#{context.limit}"
          response = RestClient.get(url)
          questions = JSON.parse(response.body, symbolize_names: true)

          if questions.any?
            context.questions = questions
          else
            context.fail!(error: "No questions found for category #{context.category}")
          end
        rescue RestClient::ExceptionWithResponse => e
          context.fail!(error: e.response)
      end
    end
  end
end
  