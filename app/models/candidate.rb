class Candidate < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :matches
  has_one_attached :photo
  has_one_attached :cv_upload

  validates :first_name, :last_name, :birth_date, :address,
            :nationality, :gender, :tech_interest, :tech_languages, :cv_upload, presence: true
  validates :terms_condition, acceptance: true

  # Custom validation method, if you want to ensure that tech_interest and tech_languages only contain specific values

  INTEREST_OPTIONS = ['Agile Developer', 'Application Developer','Artificial Intelligence Engineer', 'Cloud Engineer', 'Cyber Security Analyst', 'Cyber Security Engineer','Design Engineer', 'Generative AI Engineer', 'Machine Learning Engineer', 'Machine Learning Researcher', 'Platform Engineer', 'Software Test Engineer', 'Back-end Developer', 'Cyber/Digital/IT Security', 'Data Analyst', 'Data Scientist', 'DevOps Engineer', 'Front-end Developer', 'Full-stack Developer', 'Product Manager', 'Solutions Architect', 'Technical Programme Manager', 'Data Engineer'].freeze
  LANGUAGES_OPTIONS = ['Ruby', 'JavaScript', 'Python', 'Java', 'C#', 'Swift', 'Kotlin'].freeze

  validates :tech_interest, inclusion: { in: INTEREST_OPTIONS }
  validates :tech_languages, inclusion: { in: LANGUAGES_OPTIONS }

end
