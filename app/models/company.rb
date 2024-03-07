class Company < ApplicationRecord
  belongs_to :user
  has_many :jobs

  validates :name, :headquarters, :industry, :description, :contact_info, presence: true
end
