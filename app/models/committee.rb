class Committee < ActiveRecord::Base
    mount_uploader :logo, LogoUploader
    has_many :covos
    has_many :voivodships, :through => :covos
    has_many :votes
    validates_presence_of :name

end
