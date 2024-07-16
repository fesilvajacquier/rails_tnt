class ResourcesController < ApplicationController
  def index
    @resources = Resource.all.order(created_at: :desc)
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    @resources = Resource.all.order(created_at: :desc)

    if @resource.save
      @resource = Resource.new
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  def show
    @resource = Resource.find(params[:id])
    @comment = Comment.new
  end

  private

  def resource_params
    params.require(:resource).permit(:name, :description)
  end
end
