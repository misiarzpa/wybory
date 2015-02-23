class Voivodship < ActiveRecord::Base
  has_many :covos
  has_many :committees, :through => :covos
  has_many :districts
  validates :name, length: { minimum: 4 }, presence: true
  validates :councilman, presence: true, numericality: { only_integer: true }
end
