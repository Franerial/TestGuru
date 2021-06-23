class TestPassage < ApplicationRecord
  MIN_SUCCESSFULL_RESULT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :before_update_set_next_question
  before_validation :set_remaining_time, on: :create

  def completed?
    current_question.nil?
  end

  def successfully_passed?
    result_percentage > MIN_SUCCESSFULL_RESULT
  end

  def result_percentage
    (correct_questions.to_f / test.questions.count) * 100
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    mark_as_successfully_passed if successfully_passed?
    save!
  end

  def current_question_number
    test.questions.count - next_questions.count
  end

  def next_questions
    test.questions.order(:id).where("id > ?", current_question.id)
  end

  def mark_as_successfully_passed
    self.sucessfully_passed = true
  end

  def check_lefted_time
    self.closed = Time.now >= remaining_time
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def before_update_set_next_question
    self.current_question = test.questions.order(:id).where("id > ?", current_question.id).first
    self.closed = completed?
  end

  def set_remaining_time
    self.remaining_time = test.http_end_time
  end
end
