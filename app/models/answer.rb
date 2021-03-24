class Answer < ApplicationRecord
  belongs_to :question

  validate :validate_max_answers_number, on: :create
  validates :body, presence: true

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers_number
    errors.add(:base, 'Number of answers per question can\'t be greater than 4') if question.answers.count >= 4
  end
end
