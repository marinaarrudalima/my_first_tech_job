class Candidate < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :matches
  has_one_attached :photo
  has_one_attached :cv_upload

  validates :first_name, :last_name, :birth_date, :address, :nationality, :gender, :tech_interest, :tech_languages, presence: true
  # validates :terms_condition, acceptance: true
end
