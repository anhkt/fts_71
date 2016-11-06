class Question < ApplicationRecord
  belongs_to :subject

  has_many :answers, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :exams, through: :results

  validates :content, presence: true
  accepts_nested_attributes_for :answers, reject_if: :all_blank
end
