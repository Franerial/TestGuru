class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins("JOIN passing_tests ON tests.id = passing_tests.test_id").where("passing_tests.user_id = :user_id AND level = :level", { user_id: id, level: level })
  end

  has_many :passing_tests
  has_many :tests, through: :passing_tests
  has_many :authored_tests, :foreign_key => "author_id", :class_name => "Test"
end
