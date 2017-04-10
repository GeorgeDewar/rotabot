class Roster < ApplicationRecord
  has_many :assignments

  enum period: { weekly: 1, monthly: 2 }
end
