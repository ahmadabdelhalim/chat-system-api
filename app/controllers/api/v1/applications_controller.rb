class Api::V1::ApplicationsController < ApplicationController
  before_action :find_application, only: [:show, :update]

  def index
    @applications = Application.includes(:chats).all
    render json: @applications, each_serializer: Api::V1::ApplicationSerializer
  end

  def show
    render json: @application
  end

  def create
    @application = Application.create!(application_params)
    render json: @application, status: :created
  end

  def update
    @application.update(application_params)
    render json: @application, status: :ok
  end

  private

  def find_application
    @application = Application.find_by!(access_token: params[:access_token]);
  end

  def application_params
    params.require(:application).permit(:name)
  end
end