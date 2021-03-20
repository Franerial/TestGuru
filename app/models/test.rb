class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, :class_name => "User"

  has_many :questions, dependent: :destroy
  has_many :passing_tests, dependent: :destroy
  has_many :users, through: :passing_tests

  def self.tests_by_category(category_title)
    #joins("JOIN categories ON tests.category_id = categories.id").where("categories.title = ?", category_title).order(id: :desc).pluck(:title)
    joins(:category).where({ category: { title: category_title } }).order(id: :desc).pluck(:title)
  end
end
