class Linelist < ActiveRecord::Base
    mount_uploader :picture, PictureUploader
    mount_uploader :document, DocumentUploader
	
	validates :group_number, presence: true, allow_blank: true
    validates :day, presence: true, allow_blank: true
    validates :linename, presence: true, allow_blank: true
    validates :line_info, presence: true, allow_blank: true
    validates :travel_content, presence: true, allow_blank: true
    validates :price, presence: true, allow_blank: true
    validates :record_person, presence: true, allow_blank: true
    validates :selling_ornot, presence: true, allow_blank: true

end