class Voivodship < ActiveRecord::Base
  has_many :covos
  has_many :committees, :through => :covos
  has_many :districts
end
