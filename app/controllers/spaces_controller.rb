class SpacesController < ApplicationController

	before_action :find_space, only: %i[ show update destroy ]
	skip_before_action :authorize, only: %i[ index show create update destroy ]
	
	# GET /items
	def index
		@spaces = Space.all
		render json: @spaces, status: :ok
	end

	# GET /items/:id
	def show
		render json: find_space, status: :ok
	end

	# POST /spaces
	def create
		space = Space.create!(space_params)
		render json: space, status: :created
	end

	# PATCH /items/:id
	def update
		space = find_space
		space.update(find_space)
		render json: space, status: :created
	end

	# DELETE /items/:id
	def destroy
		find_space.destroy
	end


	private

	def find_space
		@space = Space.find_by(id: params[:id])
	end

	def space_params
		params.require(:space).permit(:name, :price, :location, :description)
	end

	# def authorize
	# 	render json: {error: "Not authorized to perform this action"}, status: :unauthorized unless session.inlude? :admin_id
	# end

	def render_not_found_response
		render json: { error: "Space not found" }, status: :not_found
	end
end


