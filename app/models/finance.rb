class Finance < ActiveRecord::Base

	validates :out_date, presence: true
	validates :package_date, presence: true, allow_blank: true
	validates :content, presence: true, allow_blank: true
	validates :travel_agency, presence: true, allow_blank: true	
	validates :person_number, presence: true, allow_blank: true	
	validates :price4_person, presence: true, allow_blank: true	
	validates :should, presence: true, allow_blank: true	
	validates :received, presence: true, allow_blank: true
	validates :balance, presence: true, allow_blank: true	
	validates :remark, presence: true, allow_blank: true	
end
