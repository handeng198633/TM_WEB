class Packageorder < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }

	validates :group_number, presence: true, allow_blank: true
      validates :outdate, presence: true, allow_blank: true
      validates :returndate, presence: true, allow_blank: true
      validates :travel_agency, presence: true, allow_blank: true
      validates :person_list, presence: true, allow_blank: true
      validates :travel_content, presence: true, allow_blank: true
      validates :price1, presence: true, allow_blank: true
      validates :price2, presence: true, allow_blank: true
      validates :price3, presence: true, allow_blank: true
      validates :price4, presence: true, allow_blank: true
      validates :out_tracffic, presence: true, allow_blank: true
      validates :return_tracffic, presence: true, allow_blank: true
      validates :cost, presence: true, allow_blank: true
      validates :package_ornot, presence: true, allow_blank: true
      validates :sales, presence: true, allow_blank: true
end
