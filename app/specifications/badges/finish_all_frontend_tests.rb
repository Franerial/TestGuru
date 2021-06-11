module Badges
  class FinishAllFrontendTests < AbstractBadgeRuleSpecification
    CATEGORY_TITLE = "Frontend"

    def satisfies?
      selected_category_tests = Test.tests_by_category(CATEGORY_TITLE)
      user_successfully_passed_tests_by_category = Test.joins(:category).where({ id: user_successfully_passed_tests.pluck(:id) }).where(["categories.title = ?", CATEGORY_TITLE])

      (selected_category_tests.pluck(:id).sort == user_successfully_passed_tests_by_category.pluck(:id).sort) && (test_passage.test.category.title == CATEGORY_TITLE) && (!user_contain_current_badge?)
    end
  end
end
