module Badges
  ELEMENTARY_LEVEL = 1

  class FinishAllElementaryLevelTests < AbstractBadgeRuleSpecification
    def satisfies?
      user_successfully_passed_tests_by_level = Test.where({ id: user_successfully_passed_tests.pluck(:id) }).where(["level = ?", ELEMENTARY_LEVEL])
      (Test.elementary_level.pluck(:id).sort == user_successfully_passed_tests_by_level.pluck(:id).sort) && (test_passage.test.level == ELEMENTARY_LEVEL) && (!user_contain_current_badge?)
    end
  end
end
