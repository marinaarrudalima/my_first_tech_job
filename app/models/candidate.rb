class Candidate < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :matches
  has_one_attached :photo
  has_one_attached :resume

  validates :first_name, :last_name, :birth_date, :address, :nationality, :gender, :tech_interest, :tech_languages, presence: true
  validates :terms_condition, acceptance: true

  # Custom validation method, if you want to ensure that tech_interest and tech_languages only contain specific values

  INTEREST_OPTIONS = ['Web Development', 'Data Science', 'Cyber Security', 'UI/UX', 'Mobile Development', 'Product Management'].freeze
  LANGUAGES_OPTIONS = ['Ruby', 'JavaScript', 'Python', 'Java', 'C#', 'Swift', 'Kotlin'].freeze

  validates :tech_interest, inclusion: { in: INTEREST_OPTIONS }
  validates :tech_languages, inclusion: { in: LANGUAGES_OPTIONS }

end
