class Question < ApplicationRecord
  belongs_to :subject

  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :exams, through: :results
end
