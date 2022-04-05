class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatbox

  after_create_commit { broadcast_append_to self.chatbox }

  before_create :confirm_participant

	def confirm_participant
		if self.chatbox.is_private
			is_participant = Participant.where(user_id: self.user.id, chatbox_id: self.chatbox.id).first
			throw :abort unless is_participant
		end
	end

end
