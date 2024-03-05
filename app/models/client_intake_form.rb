class ClientIntakeForm < ApplicationRecord
  belongs_to :company
  belongs_to :user, optional: true
end
