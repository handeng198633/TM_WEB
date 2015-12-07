class FitOrder < ActiveRecord::Base
	default_scope -> { order('created_at DESC') }

      validates :group_number, presence: true, allow_blank: true
      validates :outdate, presence: true, allow_blank: true
      validates :returndate, presence: true, allow_blank: true
      validates :bookinfo, presence: true, allow_blank: true
      validates :info, presence: true, allow_blank: true
      validates :persons_list, presence: true, allow_blank: true
      validates :comeinfo, presence: true, allow_blank: true
      validates :goinfo, presence: true, allow_blank: true
      validates :price1, presence: true, allow_blank: true
      validates :price2, presence: true, allow_blank: true
      validates :price3, presence: true, allow_blank: true
      validates :price4, presence: true, allow_blank: true
      validates :customers_info, presence: true, allow_blank: true
      validates :tip, presence: true, allow_blank: true
      validates :recipient, presence: true, allow_blank: true
      validates :current_collction, presence: true, allow_blank: true
      validates :status, presence: true, allow_blank: true
end
