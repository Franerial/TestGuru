class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validate :validate_max_answers_number, on: :create
  validates :body, presence: true

  private

  def validate_max_answers_number
    errors.add(:base, 'Number of answers per question can\'t be greater than 4') if question.answers.size > 4
  end
end
