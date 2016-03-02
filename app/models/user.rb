class User < ActiveRecord::Base

	has_secure_password
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true, format: {with: /^[\w.+-]+@([\w]+.)+\w+$/}

	before_validation :prep_email

	private

	def prep_email
		self.email = self.email.strip.downcase if email
	end	
end
