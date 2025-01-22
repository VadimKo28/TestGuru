class Answer < ApplicationRecord
  belongs_to :question

  validate :validate_answers_count

  scope :correct_answers, -> { where(correct: true) }

  def validate_answers_count
    if question.answers.size > 4
      errors.add(:answer, "должно быть от 1 до 4 ответов")
    end
  end
end
