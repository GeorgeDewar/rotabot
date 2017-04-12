class Person < ApplicationRecord
  has_many :assignments

  def full_name
    [first_name, last_name].compact.join(' ')
  end
end
