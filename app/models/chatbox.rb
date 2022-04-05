class Chatbox < ApplicationRecord
	has_many :messages
	has_many :participants, dependent: :destroy
	after_create_commit { broadcast_if_public }
	
	validates_uniqueness_of :name
	scope :public_chatboxes, -> { where(is_private: false) }
	# after_create_commit {broadcast_append_to "chatboxes"}




	def broadcast_if_public
		broadcast_append_to "rooms" unless self.is_private
	end

	def self.create_private_room(users, room_name)
		single_chatbox = Chatbox.create(name: chatbox_name, is_private: true)
		users.each do |user|
		Participant.create(user_id: user.id, chatbox_id: single_chatbox.id )
	end
		single_chatbox
	end
end
