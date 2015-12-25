class User < ActiveRecord::Base
	attr_accessor :remember_token

#	has_many :fit_orders, dependent: :destroy
	has_many :package_orders, dependent: :destroy

	validates :name, presence: true, uniqueness: { case_sensitive: false, message:" 该用户名已存在！" }, length: { maximum: 15 }
	validates :contact_info, presence: true, allow_blank: true, length: { maximum: 50 }


	has_secure_password
	validates :password, presence: true, length:{ minimum: 6, maximum: 10 }

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def remember
		self.remember_token = User.new_token
		update_attribute(:remember_digest, User.digest(remember_token))
	end

	def forget
		update_attribute(:remember_digest, nil)
	end

	def User.digest(string)
		cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : 10
		BCrypt::Password.create(string, cost: cost)
	end

	def authenticated?(remember_token)
#		digest = send("#{attribute}_digest")
		return false if remember_digest.nil?
		BCrypt::Password.new(remember_digest).is_password?(remember_token)
	end

end
