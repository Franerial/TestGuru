module Badges
  ADVANCED_LEVEL = 2

  class FinishAllAdvancedLevelTests < AbstractBadgeRuleSpecification
    def satisfies?
      user_successfully_passed_tests_by_level = Test.where({ id: user_successfully_passed_tests.pluck(:id) }).where(["level = ?", ADVANCED_LEVEL])
      (Test.advanced_level.pluck(:id).sort == user_successfully_passed_tests_by_level.pluck(:id).sort) && (test_passage.test.level == ADVANCED_LEVEL) && (!user_contain_current_badge?)
    end
  end
end
