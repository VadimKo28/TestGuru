class Question < ApplicationRecord
  belongs_to :test
  has_many :answers

  validates :body, presence: true
  validate :validate_answers_count

  def validate_answers_count
    if answers.size > 4
      errors.add(:answers, "должно быть от 1 до 4 ответов")
    end
  end
end
