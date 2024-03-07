class Job < ApplicationRecord
  belongs_to :company
  has_many :matches

  validates :title, :job_description, :soft_skills, :programming_languages, :work_visa, :salary, :application_deadline, presence: true
end
