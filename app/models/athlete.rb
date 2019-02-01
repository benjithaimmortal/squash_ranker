class Athlete < ApplicationRecord

  before_save { self.name = name.upcase }

  validates :name,   presence: true,
    uniqueness: { case_sensitive: false }
  validates :rating, presence: true
  validates :level,  presence: true
end
