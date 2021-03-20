class User < ApplicationRecord
  has_many :passing_tests, dependent: :destroy
  has_many :tests, through: :passing_tests
  has_many :authored_tests, foreign_key: "author_id", class_name: "Test", dependent: :destroy

  validates :email, :name, :password, presence: true

  def tests_by_level(level)
    Test.joins(:passing_tests).where({ passing_tests: { user_id: id }, level: level })
  end
end
