class User < ActiveRecord::Base
	has_many :created_events, foreign_key: :creator_id, class_name: "Event"
	has_many :commitments, foreign_key: :event_attendee_id
	has_many :attended_events, through: :commitments, source: :attended_event

	validates :name, presence: true
	validates :email, presence: true
	validates :password, presence: true, length: { minimum: 6 }

	has_secure_password

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
			Self.remember_token = User.digest(User.new_remember_token)
		end
end