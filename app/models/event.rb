class Event < ActiveRecord::Base
	belongs_to :creator, class_name: "User"
	has_many :commitments, foreign_key: :attended_event_id
	has_many :event_attendees, through: :commitments, source: :event_attendee
end
