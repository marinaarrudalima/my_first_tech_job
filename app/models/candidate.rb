class Candidate < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :matches
  has_one_attached :photo
  has_one_attached :cv_upload

  validates :first_name, :last_name, :birth_date, :address,
            :nationality, :gender, :tech_interest, :tech_languages, :terms_conditions, presence: true
  validates :terms_condition, acceptance: true
  validates :summary, length: { maximum: 1000 }
  # Custom validation method, if you want to ensure that tech_interest and tech_languages only contain specific values

  INTEREST_OPTIONS = ["Full-stack Development",
    "Front-end Development",
    "Back-end Development",
    "Mobile App Development",
    "UX/UI Design",
    "Graphic Design",
    "Data Science",
    "Data Analysis",
    "Business Intelligence",
    "AI & Machine Learning",
    "Research in AI & ML",
    "Cloud Computing",
    "DevOps & SysOps",
    "Cybersecurity",
    "Product Management",
    "Project Management",
    "Generative AI & Creative Technologies"].freeze
  LANGUAGES_OPTIONS = [
    "HTML",
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

  validates :tech_interest, inclusion: { in: INTEREST_OPTIONS }
  validates :tech_languages, inclusion: { in: LANGUAGES_OPTIONS }
end
