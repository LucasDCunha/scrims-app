class ChatRoomsController < ApplicationController
    before_action :set_chat_room, only: [:show]

    def index
        @chat_rooms = ChatRoom.all.select { |t|
            t.user == current_user || t.team.user == current_user
        }
    end

    def show
        @message = Message.new
        @messages = Message.all.select { |t|
            t.chat_room.id == params[:id].to_i
        }
    end

    def create(chat_room = nil)
        @chat_room = ChatRoom.new
        @chat_room.user = current_user
        @chat_room.team = Team.find(params[:chat_room][:team].to_i)
        chat = ChatRoom.all.select { |s| s.team == @chat_room.team && s.user == @chat_room.user }
        if chat.count > 0
            redirect_to chat_room_path(chat.first.id)
            return
        end
        if @chat_room.save
            redirect_to chat_room_path(@chat_room.id)
        else
            redirect_to root_path()
        end
    end

    private

    def set_chat_room
        @chat_room = ChatRoom.find(params[:id])
    end
end
