class Job < ApplicationRecord
  belongs_to :company
  has_many :matches, dependent: :destroy

  validates :title, :job_description, :location, :soft_skills, :programming_languages, :work_visa, :salary, :application_deadline, presence: true
  include PgSearch::Model
  pg_search_scope :search_by_title_programming_languagues,
    against: [:title, :programming_languages],
    associated_against: {
      company: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }

end
