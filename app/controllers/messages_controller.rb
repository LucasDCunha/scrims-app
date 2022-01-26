class MessagesController < ApplicationController

    def create
        @message = Message.new(message_params)
        @message.user = current_user
        @message.chat_room = ChatRoom.find(params[:message][:chat_room].to_i)
        @message.save
        redirect_to chat_room_path(params[:message][:chat_room].to_i)
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end
end
