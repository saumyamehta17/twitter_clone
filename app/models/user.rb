class User < ActiveRecord::Base

	has_secure_password
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true#, format: {with: /^[\w.+-]+@([\w]+.)+\w+$/}

	before_validation :prep_email
	before_save :create_avatar_url

	has_many :rabbits
	has_many :follower_relationships, class_name: 'Relationship', foreign_key: :followed_id
	has_many :followed_relationships, class_name: 'Relationship', foreign_key: :follower_id

	has_many :followers, through: :follower_relationships
	has_many :followeds, through: :followed_relationships

	# self following user
	def following? user
		self.followeds.include? user
	end

	def follow user
		Relationship.create follower_id: self.id, followed_id: user.id
	end	

	private

	def create_avatar_url
		self.avatar_url = "http://www.gravatar.com/avatar/7bce52aa3c61817450707fc8f44acc54?s=50"
	end	

	def prep_email
		self.email = self.email.strip.downcase if email
	end	
end
