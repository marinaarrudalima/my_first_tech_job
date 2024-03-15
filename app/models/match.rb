class Match < ApplicationRecord
  belongs_to :candidate
  belongs_to :job
  after_save :notify

  enum status: {
    Submitted: 0,
    Review: 1,
    First_interview: 2,
    Second_interview: 3,
    Job_offer: 4,
    Onboarded: 5,
    Rejected: 6
  }

  private

  def notify
    NotificationChannel.broadcast_to( candidate.user, {match_id: id})
  end
end
