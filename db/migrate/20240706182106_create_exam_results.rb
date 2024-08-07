class CreateExamResults < ActiveRecord::Migration[7.1]
  def change
    create_table :exam_results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.integer :score
      t.integer :total_questions

      t.timestamps
    end
  end
end
