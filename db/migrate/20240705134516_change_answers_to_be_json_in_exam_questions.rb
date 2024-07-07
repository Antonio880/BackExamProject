class ChangeAnswersToBeJsonInExamQuestions < ActiveRecord::Migration[7.1]
  def change
    # Adicionar novas colunas com tipo jsonb
    add_column :exam_questions, :new_answers, :jsonb, default: {}
    add_column :exam_questions, :new_correct_answers, :jsonb, default: {}

    # Copiar os dados das colunas antigas para as novas
    ExamQuestion.reset_column_information
    ExamQuestion.find_each do |question|
      question.update_columns(
        new_answers: question.read_attribute_before_type_cast('answers'),
        new_correct_answers: question.read_attribute_before_type_cast('correct_answers')
      )
    end

    # Remover as colunas antigas
    remove_column :exam_questions, :answers
    remove_column :exam_questions, :correct_answers

    # Renomear as novas colunas para o nome original
    rename_column :exam_questions, :new_answers, :answers
    rename_column :exam_questions, :new_correct_answers, :correct_answers
  end
end
