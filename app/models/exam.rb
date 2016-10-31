class Exam < ApplicationRecord
  belongs_to :user
  belongs_to :subject

  has_many :results, dependent: :destroy
  has_many :questions, dependent: :destroy, through: :suggest_questions
end
