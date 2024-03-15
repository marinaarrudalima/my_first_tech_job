class Job < ApplicationRecord
  belongs_to :company
  has_many :matches, dependent: :destroy

  validates :title, :job_description, :location, :soft_skills, :programming_languages, :work_visa, :salary, :application_deadline, presence: true

  LANGUAGES_OPTIONS = ["HTML",
    "CSS",
    "JavaScript",   # Widely used in front-end and full-stack development
    "Python",       # Popular in data science, AI/ML, and back-end development
    "Java",         # Used in back-end development, Android app development
    "Ruby",         # Often used in web and back-end development
    "PHP",          # Common in web development
    "C#",           # Used in back-end development, mobile apps (Xamarin), and game development
    "Swift",        # Primary language for iOS app development
    "Kotlin",       # Used for Android app development and also back-end
    "TypeScript",   # Gaining popularity in front-end and full-stack development
    "Scala",        # Used in big data processing and also back-end development
    "R",            # Used in data analysis and statistics
    "SQL",          # Essential for database management
    "Go",           # Known for performance and efficiency, used in cloud services and back-end
    "Rust",         # Used in systems programming, including blockchain technologies
    "Dart",         # Used for developing mobile, desktop, backend, and web applications with Flutter
    "MATLAB",       # Used in engineering, science computations, and AI/ML research
    "Objective-C",  # Previously used for iOS and OS X development
    "Shell Scripting" # Useful for DevOps, sysops, and automation tasks
  ].freeze

  validates :programming_languages, inclusion: { in: LANGUAGES_OPTIONS }

  include PgSearch::Model
  pg_search_scope :search_by_title_programming_languagues_companyname,
    against: [:title, :programming_languages, :location, :created_at, :application_deadline],
    associated_against: {
      company: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }
    scope :newest_first, -> { order(created_at: :desc) }
    scope :closest_deadline, -> { order(application_deadline: :asc)}

  def content(user)
    @address = user.candidate.address
    @summary = user.candidate.summary
    @tech_interest = user.candidate.tech_interest
    @tech_languages = user.candidate.tech_languages
    @preferred_companies = user.candidate.preferred_companies

    Rails.cache.fetch("#{cache_key_with_version}/content") do
      client = OpenAI::Client.new
      chaptgpt_response = client.chat(parameters: {
      model: "gpt-3.5-turbo",
      messages: [{ role: "user", content: "I will give you information for a candidate's profile and the information for a job posting. I want you to cross-match the information on the candidate's skills focusing on key-words (particularly #{@address}, #{@summary}, #{@tech_interest}, #{@tech_languages} and #{@preferred_companies}) and the information on the job listing (particularly #{title}, #{job_description}, #{soft_skills}, #{programming_languages}, #{location}, #{company.name}) and return a summary of the compatibility. Ensure you also consider if any word in the job listing's information matches a word in the candidate's summary.I want you to return an explanation directed to the candidate but without the candidate's personal information.Please include if this person should apply for this job or not. Limit to 300 characteres."}]
      })
      chaptgpt_response["choices"][0]["message"]["content"]
    end
  end
end
