module TestHelper
  def view_test_title(question)
    test = question.test

    if question.new_record?
      "#{test.title} Create question"
    else
      "#{test.title} Edit question"
    end
  end
end
