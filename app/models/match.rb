class Match < ApplicationRecord
  belongs_to :candidate
  belongs_to :job

  enum status: {
    submitted: 0,
    review: 1,
    first_interview: 2,
    second_interview: 3,
    job_offer: 4,
    onboarded: 5,
    rejected: 6
  }
end
