class Test < ApplicationRecord
  def self.tests_by_category(category_title)
    joins("JOIN categories ON tests.category_id = categories.id").where("categories.title = ?", category_title).order(id: :desc).pluck(:title)
  end
  belongs_to :category
  has_many :questions
  has_many :users, through: :passing_tests
  belongs_to :author, :class_name => "User"
end
