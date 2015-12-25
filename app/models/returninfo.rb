class Returninfo < ActiveRecord::Base
	default_scope -> { order('created_at DESC') }

	validates :category, presence: true, allow_blank: true
	validates :content, presence: true, allow_blank: true
	validates :remark, presence: true, allow_blank: true
	validates :state, presence: true, allow_blank: true	
end
