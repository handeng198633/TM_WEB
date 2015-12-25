class Netprofit < ActiveRecord::Base
	default_scope -> { order('created_at DESC') }

	validates :month, presence: true, allow_blank: true
	validates :total_income, presence: true, allow_blank: true
	validates :total_coat, presence: true, allow_blank: true
	validates :profit, presence: true, allow_blank: true
	validates :gfax, presence: true, allow_blank: true
	validates :net_profit, presence: true, allow_blank: true
	validates :state, presence: true, allow_blank: true
end
