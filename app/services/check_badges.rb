class CheckBadges
  def initialize(test_passage:)
    @test_passage = test_passage
    @user = test_passage.user
    @test = test_passage.test
    @badges = Badge.all
  end

  def call
    @badges.each do |badge|
      if send("#{badge.rule}?".to_sym, badge.rule_attribute)
        @user.badges_users.create!(badge: badge)
      end
    end
  end

  def first_try_test?(_attribute)
    @user.test_passages.where(test_id: @test.id).successfully_passed.count == 1
  end

  def all_category_tests?(attribute)
    tests_by_category = Test.by_category(attribute)

    success_passed_tests_by_category = @user.test_passages.where(test_id: tests_by_category.ids).successfully_passed

    (tests_by_category.ids - success_passed_tests_by_category.pluck(:test_id).uniq).empty?
  end

  def one_level_tests?(attribute)
    tests_by_level = Test.by_level(attribute)

    success_passed_tests_by_level = @user.test_passages.where(test_id: tests_by_level.ids).successfully_passed

    (tests_by_level.ids - success_passed_tests_by_level.pluck(:test_id).uniq).empty?
  end

end

