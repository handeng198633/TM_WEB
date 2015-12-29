class Trainticket < ActiveRecord::Base

	validates :category, presence: true, allow_blank: true
	validates :order_id, presence: true, allow_blank: true
	validates :number, presence: true, allow_blank: true
	validates :outdate, presence: true
	validates :travel_content, presence: true, allow_blank: true	
	validates :combined_transport, presence: true, allow_blank: true	
	validates :place, presence: true, allow_blank: true	
	validates :person_name, presence: true, allow_blank: true
	validates :person_idcard, presence: true, allow_blank: true	
	validates :ticket_cost, presence: true, allow_blank: true	
	validates :difficulty, presence: true, allow_blank: true	
	validates :seat1, presence: true, allow_blank: true
	validates :seat2, presence: true, allow_blank: true
	validates :remark, presence: true, allow_blank: true
	validates :record_person, presence: true, allow_blank: true
	validates :record_remark, presence: true, allow_blank: true
	validates :state, presence: true, allow_blank: true
	validates :state_step, presence: true, allow_blank: true		
end
