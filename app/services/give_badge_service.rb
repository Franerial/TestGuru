class GiveBadgeService
  attr_reader :user, :passing_test, :user_successfully_passed_tests

  def initialize(user, passing_test)
    @user = user
    @passing_test = passing_test
    @user_successfully_passed_tests = user.test_passages.select { |passage| passage.successfully_passed? }.map(&:test)
  end

  def call
    received_badges = []

    Badge.all.each do |badge|
      received_badges << badge if send("#{badge.rule.rule_type}?")
    end
    user.badges.push(received_badges)
    received_badges.empty?
  end

  private

  def pass_test_by_category?(category_title)
    selected_category_tests = Test.tests_by_category(category_title)
    user_successfully_passed_tests_by_category = user_successfully_passed_tests.select { |test| test.category.title == category_title }

    (selected_category_tests.sort == user_successfully_passed_tests_by_category.sort) && (passing_test.test.category.title == category_title)
  end

  def pass_all_frontend_tests?
    category_title = "Frontend"
    pass_test_by_category?(category_title)
  end

  def pass_all_backend_tests?
    category_title = "Backend"
    pass_test_by_category?(category_title)
  end

  def pass_all_machine_learning_tests?
    category_title = "Machine learning"
    pass_test_by_category?(category_title)
  end

  def pass_test_on_first_try?
    (passing_test.successfully_passed?) && (user.test_passages.map(&:test).count(passing_test.test) == 1)
  end

  def pass_all_easy_level_tests?
    user_successfully_passed_tests_by_level = user_successfully_passed_tests.select { |test| test.level == 0 }

    (Test.easy_level.sort == user_successfully_passed_tests_by_level.sort) && (passing_test.test.level == 0)
  end

  def pass_all_elementary_level_tests?
    user_successfully_passed_tests_by_level = user_successfully_passed_tests.select { |test| test.level == 1 }

    (Test.elementary_level.sort == user_successfully_passed_tests_by_level.sort) && (passing_test.test.level == 1)
  end

  def pass_all_advanced_level_tests?
    user_successfully_passed_tests_by_level = user_successfully_passed_tests.select { |test| test.level == 2 }

    (Test.advanced_level.sort == user_successfully_passed_tests_by_level.sort) && (passing_test.test.level == 2)
  end

  def pass_all_hard_level_tests?
    user_successfully_passed_tests_by_level = user_successfully_passed_tests.select { |test| test.level == 3 }

    (Test.hard_level.sort == user_successfully_passed_tests_by_level.sort) && (passing_test.test.level == 3)
  end

  def pass_all_hero_level_tests?
    user_successfully_passed_tests_by_level = user_successfully_passed_tests.select { |test| test.level.between?(4, Float::INFINITY) }

    (Test.hero_level.sort == user_successfully_passed_tests_by_level.sort) && (passing_test.test.level.between?(4, Float::INFINITY))
  end
end
