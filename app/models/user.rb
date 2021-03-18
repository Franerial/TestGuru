class User < ApplicationRecord
  has_many :passing_tests, dependent: :destroy
  has_many :tests, through: :passing_tests
  has_many :authored_tests, foreign_key: "author_id", class_name: "Test", dependent: :destroy

  def tests_by_level(level)
    #Test.joins("JOIN passing_tests ON tests.id = passing_tests.test_id").where("passing_tests.user_id = :user_id AND level = :level", { user_id: id, level: level })
    Test.joins(:passing_tests).where({ passing_tests: { user_id: id }, level: level })
  end
end
