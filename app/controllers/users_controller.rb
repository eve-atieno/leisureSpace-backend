class UsersController < ApplicationController

    def index
        users=User.all
        render json: users
    end

    def show
        users=User.find(params[:id])
        render json: users
    end

    def create
        users=User.create(users_params)
        render json: users
    end

    def update
        users=User.find(params[:id])
        users.update(users_params)
        render json: users
    end

    def destroy
        users=User.find(params[:id])
        users.destroy
        render json: users
    end

    private

    def users_params
        params.permit(:email, :password, :is_active)
    end
end