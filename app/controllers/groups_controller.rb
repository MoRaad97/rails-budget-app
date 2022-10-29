class GroupsController < ApplicationController
  before_action :authenticate_user!

  # GET /foods {group list page}
  def index
    @groups = Group.where(user: current_user)
  end

  # GET /groups/new {create form page}
  def new
    @group = Group.new
  end

  # POST /groups {Create Action}
  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to groups_path, notice: 'group was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Delete group Action
  def destroy
    @group = Group.where(id: params[:id], user: current_user)
    redirect_to groups_path, notice: 'group was successfully Deleted.' if @group.destroy(params[:id])
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon ).merge(user: current_user)
  end
end
