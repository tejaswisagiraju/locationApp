class User < ActiveRecord::Base
	validates :password, 
          # you only need presence on create
          :presence => { :on => :create },
          # allow_nil for length (presence will handle it on create)
          :length   => { :minimum => 6, :allow_nil => true },
          # and use confirmation to ensure they always match
          :confirmation => true
	validates :email, uniqueness: true

	has_secure_password
	has_many :locations, dependent: :destroy

	include Gravtastic
	gravtastic

	def self.confirm(params)
		@user = User.find_by({email: params[:email]})
		@user.try(:authenticate, params[:password])
	end
end
