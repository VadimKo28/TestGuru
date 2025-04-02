module TestPassagesHelper
  def position_current_question(test_passage)
    if test_passage.test.questions.any?
      test_passage.test.questions.index(test_passage.current_question) + 1
    end
  end
end
