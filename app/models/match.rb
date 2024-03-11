class Match < ApplicationRecord
  belongs_to :candidate
  belongs_to :job

  enum status: {
    Submitted: 0,
    Review: 1,
    First_interview: 2,
    Second_interview: 3,
    Job_offer: 4,
    Onboarded: 5,
    Rejected: 6
  }
end
