class Plant < ApplicationRecord
  belongs_to :garden
  has_many :plant_tags, dependent: :destroy
  # when I remove plant, all its plant_tags get removed as well
  has_many :tags, through: :plant_tags
end
