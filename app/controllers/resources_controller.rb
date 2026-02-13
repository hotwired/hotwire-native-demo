class ResourcesController < ApplicationController
  def index
  end

  def new
    @resource = Resource.new
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.valid?
      redirect_to resource_path(
        first_name: @resource.first_name,
        last_name: @resource.last_name
      ), notice: "Form submitted successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @first_name = params[:first_name]
    @last_name = params[:last_name]
  end

  def long
  end

  def scroll
  end

  def upload
  end

  private

  def resource_params
    params.require(:resource).permit(:first_name, :last_name)
  end
end
