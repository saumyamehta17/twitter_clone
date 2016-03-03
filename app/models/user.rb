class User < ActiveRecord::Base

	has_secure_password
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true#, format: {with: /^[\w.+-]+@([\w]+.)+\w+$/}

	before_validation :prep_email
	before_save :create_avatar_url

	private

	def create_avatar_url
		self.avatar_url = "http://www.gravatar.com/avatar/7bce52aa3c61817450707fc8f44acc54?s=50"
	end	

	def prep_email
		self.email = self.email.strip.downcase if email
	end	
end
