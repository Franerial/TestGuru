class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, :class_name => "User"

  has_many :questions, dependent: :destroy
  has_many :passing_tests, dependent: :destroy
  has_many :users, through: :passing_tests

  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true

  scope :easy_level, -> { where(level: 0..1) }
  scope :mid_level, -> { where(level: 2..4) }
  scope :hard_level, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, ->(category_title) { joins(:category).where(category: { title: category_title }) }
  scope :tests_titles_by_category, ->(category_title) { tests_by_category((category_title)).order(id: :desc).pluck(:title) }
end
