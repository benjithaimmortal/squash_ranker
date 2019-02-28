class Athlete < ApplicationRecord

  before_save { name.upcase! }

  validates :level,    presence: true
  validates :positive, presence: true
  validates :negative, presence: true
  validates :name,     presence: true,
    uniqueness: { case_sensitive: false }
end
