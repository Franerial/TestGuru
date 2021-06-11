module Badges
  HERO_LEVEL = 4

  class FinishAllHeroLevelTests < AbstractBadgeRuleSpecification
    def satisfies?
      user_successfully_passed_tests_by_level = Test.where({ id: user_successfully_passed_tests.pluck(:id) }).where(["level >= ?", HERO_LEVEL])
      (Test.hero_level.pluck(:id).sort == user_successfully_passed_tests_by_level.pluck(:id).sort) && (test_passage.test.level >= HERO_LEVEL) && (!user_contain_current_badge?)
    end
  end
end
