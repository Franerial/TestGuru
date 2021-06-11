module Badges
  EASY_LEVEL = 0

  class FinishAllEasyLevelTests < AbstractBadgeRuleSpecification
    def satisfies?
      user_successfully_passed_tests_by_level = Test.where({ id: user_successfully_passed_tests.pluck(:id) }).where(["level = ?", EASY_LEVEL])
      (Test.easy_level.pluck(:id).sort == user_successfully_passed_tests_by_level.pluck(:id).sort) && (test_passage.test.level == EASY_LEVEL) && (!user_contain_current_badge?)
    end
  end
end
