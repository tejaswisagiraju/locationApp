class User < ActiveRecord::Base
	validates :email, confirmation: true, uniqueness: true
	has_secure_password
	has_many :locations, dependent: :destroy

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
end