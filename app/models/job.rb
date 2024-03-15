class Job < ApplicationRecord
  belongs_to :company
  has_many :matches, dependent: :destroy

  validates :title, :job_description, :location, :soft_skills, :programming_languages, :work_visa, :salary, :application_deadline, presence: true

  LANGUAGES_OPTIONS = ['Ruby', 'JavaScript', 'Python', 'Java', 'C#', 'Swift', 'Kotlin'].freeze

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
