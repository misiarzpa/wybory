class District < ActiveRecord::Base
  has_many :usdis
  has_many :users, :through => :usdis
  belongs_to :voivodship
  has_many :votes
end
