class Subject < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :suggest_questions, dependent: :destroy
  has_many :exams, dependent: :destroy

  validates :name, presence: true, uniqueness: true, length: {maximum: 25}
  validates :duration, presence: true, numericality: {only_integer: true}
  validates :number_question, presence: true, numericality: {only_integer: true}
end
