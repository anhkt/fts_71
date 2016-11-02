class Result < ApplicationRecord
  belongs_to :exam
  belongs_to :question
  
  has_many :answers, dependent: :destroy
end
