class Netprofit < ActiveRecord::Base

	validates :month, presence: true
	validates :total_income, presence: true, allow_blank: true
	validates :total_coat, presence: true, allow_blank: true
	validates :profit, presence: true, allow_blank: true
	validates :fax, presence: true, allow_blank: true
	validates :net_profit, presence: true, allow_blank: true
	validates :status, presence: true, allow_blank: true
end
