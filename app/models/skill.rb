class Skill < ApplicationRecord
  validates :skill_type, presence: true, uniqueness: true
end
