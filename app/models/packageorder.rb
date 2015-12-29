class Packageorder < ActiveRecord::Base
	belongs_to :user

	validates :group_number, presence: true, allow_blank: true
      validates :outdate, presence: true
      validates :returndate, presence: true
      validates :travel_agency, presence: true, allow_blank: true
      validates :person_list, presence: true, allow_blank: true
      validates :travel_content, presence: true, allow_blank: true
      validates :price1, presence: true, allow_blank: true
      validates :price2, presence: true, allow_blank: true
      validates :price3, presence: true, allow_blank: true
      validates :price4, presence: true, allow_blank: true
      validates :out_tracffic_way, presence: true, allow_blank: true
      validates :return_tracffic_way, presence: true, allow_blank: true
      validates :out_tracffic, presence: true, allow_blank: true
      validates :return_tracffic, presence: true, allow_blank: true
      validates :cost, presence: true, allow_blank: true
      validates :package_ornot, presence: true, allow_blank: true
      validates :sales, presence: true, allow_blank: true
end
