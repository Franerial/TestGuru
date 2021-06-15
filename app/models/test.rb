class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, :class_name => "User"

  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :title, presence: true

  scope :easy_level, -> { where(level: 0) }
  scope :elementary_level, -> { where(level: 1) }
  scope :advanced_level, -> { where(level: 2) }
  scope :hard_level, -> { where(level: 3) }
  scope :hero_level, -> { where(level: 4..Float::INFINITY) }
  scope :tests_by_category, ->(category_title) { joins(:category).where(category: { title: category_title }) }
  scope :tests_titles_by_category, ->(category_title) { tests_by_category((category_title)).order(id: :desc).pluck(:title) }
end
