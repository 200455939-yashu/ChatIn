class ChatboxesController < ApplicationController
	before_action :set_chatbox, only: %i[ show edit update destroy ]

	# GET /chatboxes or /chatboxes.json
	def index
		@current_user = current_user
		redirect_to '/signin' unless @current_user
		@chatboxes = Chatbox.public_chatboxes

		# @single_chatbox = Chatbox.find(params[:id])
		@users = User.all_except(@current_user)
	end

	# GET /chatboxes/1 or /chatboxes/1.json
	def show
		@current_user = current_user
		@single_chatbox = Chatbox.find(params[:id])
		@chatboxes = Chatbox.public_chatboxes
		@users = User.all_except(@current_user)
		@message = Message.new
		@messages = @single_chatbox.messages
		@chatbox = Chatbox.new

	render "index"
	end

	# GET /chatboxes/new
	def new
		@chatbox = Chatbox.new
	end

	# GET /chatboxes/1/edit
	def edit
	end

	# POST /chatboxes or /chatboxes.json
	def create

		@chatbox = Chatbox.new(chatbox_params)

		respond_to do |format|
			if @chatbox.save
				format.html { redirect_to chatbox_url(@chatbox), notice: "Chatbox was successfully created." }
				format.json { render :show, status: :created, location: @chatbox }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @chatbox.errors, status: :unprocessable_entity }
			end
		end
	end

	# PATCH/PUT /chatboxes/1 or /chatboxes/1.json
	def update
		respond_to do |format|
			if @chatbox.update(chatbox_params)
				format.html { redirect_to chatbox_url(@chatbox), notice: "Chatbox was successfully updated." }
				format.json { render :show, status: :ok, location: @chatbox }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @chatbox.errors, status: :unprocessable_entity }
			end
		end
	end

	# DELETE /chatboxes/1 or /chatboxes/1.json
	def destroy
		@chatbox.destroy

		respond_to do |format|
			format.html { redirect_to chatboxes_url, notice: "Chatbox was successfully destroyed." }
			format.json { head :no_content }
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_chatbox
			@chatbox = Chatbox.find(params[:id])
		end

		# Only allow a list of trusted parameters through.
		def chatbox_params
			params.permit(:name, :is_private)
		end
end
