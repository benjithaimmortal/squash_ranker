class Athlete < ApplicationRecord

  before_save { name.upcase! }

  validates :rating, presence: true
  validates :level,  presence: true
  validates :name,   presence: true,
    uniqueness: { case_sensitive: false }
end
