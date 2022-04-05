class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @current_user = current_user
    @chatboxes = Chatbox.public_chatboxes
    @users = User.all_except(@current_user)
    @chatbox = Chatbox.new
    @message = Message.new
    @room_name = get_name(@user, @current_user)
    @single_chatbox = Chatbox.where(name: @room_name).first || Chatbox.create_private_chatbox([@user, @current_user], @chatbox_name)
    @messages = @single_room.messages

    render "chatboxes/index"
  end

  private
  def get_name(user1, user2)
    users = [user1, user2].sort
    "private_#{users[0].id}_#{users[1].id}"
  end
end
