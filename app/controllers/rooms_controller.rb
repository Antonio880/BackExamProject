class RoomsController < ApplicationController
    before_action :authenticate_request!
    before_action :set_room, only: [:show, :update, :destroy, :add_user, :get_students]
  
    # GET /rooms
    def index
      @rooms = Room.all
      render json: @rooms
    end
  
    # GET /rooms/:id
    def show
      render json: @room
    end
  
    # POST /rooms/:created_by_id
    def create
      @room = Room.new(room_params)
      @room.created_by = User.find(room_params[:created_by_id])
      if @room.save
        render json: @room, status: :created
      else
        render json: @room.errors, status: :unprocessable_entity
      end
    end

    # GET /rooms/created_by/:created_by_id
    def created_by
      puts params[:created_by_id]
      @rooms = Room.where(created_by_id: params[:created_by_id])
      render json: @rooms
    end
  
    # PUT /rooms/:id
    def update
      if @room.update(room_params)
        render json: @room
      else
        render json: @room.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /rooms/:id
    def destroy
      @room.destroy
    end
  
    # POST /rooms/:room_id/users/:user_id
    def add_user
      user = User.find(params[:user_id])
      user.update(room: @room)
      render json: @room
    end
  
    # GET /rooms/:room_id/students
    def get_students
      students = @room.users
      render json: students
    end
  
    private
  
    def set_room
      @room = Room.find(params[:id])
    end
  
    def room_params
      params.require(:room).permit(:serie, :curso, :created_by_id)
    end
  end
  