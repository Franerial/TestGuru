module Badges
  HARD_LEVEL = 3

  class FinishAllHardLevelTests < AbstractBadgeRuleSpecification
    def satisfies?
      user_successfully_passed_tests_by_level = Test.where({ id: user_successfully_passed_tests.pluck(:id) }).where(["level = ?", HARD_LEVEL])
      (Test.hard_level.pluck(:id).sort == user_successfully_passed_tests_by_level.pluck(:id).sort) && (test_passage.test.level == HARD_LEVEL) && (!user_contain_current_badge?)
    end
  end
end
