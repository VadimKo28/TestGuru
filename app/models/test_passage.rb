class TestPassage < ApplicationRecord
  PASSING_THRESHOLDS = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question, on: :create
  before_validation :before_validation_set_next_question, on: :update

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    save!
  end

  def completed?
    self.current_question.nil?
  end

  def result
    correct_questions = self.correct_questions.to_f

    result = (correct_questions / test.questions.size) * 100

    result.round(2)
  end

  def success?
    result > PASSING_THRESHOLDS
  end

  private
  def before_validation_set_next_question
    self.current_question = next_question
  end

  def before_validation_set_current_question
    self.current_question = test.questions.first
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
