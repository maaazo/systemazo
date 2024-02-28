class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :company

  validates :user_id, uniqueness: { scope: %i[company_id role], message: 'User already has this role in the company' }
end
