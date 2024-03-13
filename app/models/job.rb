class Job < ApplicationRecord
  belongs_to :company
  has_many :matches, dependent: :destroy

  validates :title, :job_description, :location, :soft_skills, :programming_languages, :tech_interests, :work_visa, :salary, :application_deadline, presence: true

  INTEREST_OPTIONS = ['Agile Developer', 'Application Developer','Artificial Intelligence Engineer', 'Cloud Engineer', 'Cyber Security Analyst', 'Cyber Security Engineer','Design Engineer', 'Generative AI Engineer', 'Machine Learning Engineer', 'Machine Learning Researcher', 'Platform Engineer', 'Software Test Engineer', 'Back-end Developer', 'Cyber/Digital/IT Security', 'Data Analyst', 'Data Scientist', 'DevOps Engineer', 'Front-end Developer', 'Full-stack Developer', 'Product Manager', 'Solutions Architect', 'Technical Programme Manager', 'Data Engineer'].freeze
  LANGUAGES_OPTIONS = ['Ruby', 'JavaScript', 'Python', 'Java', 'C#', 'Swift', 'Kotlin'].freeze

  validates :tech_interests, inclusion: { in: INTEREST_OPTIONS }
  validates :programming_languages, inclusion: { in: LANGUAGES_OPTIONS }

  include PgSearch::Model
  pg_search_scope :search_by_title_programming_languagues_companyname,
    against: [:title, :programming_languages, :location],
    associated_against: {
      company: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }

end
