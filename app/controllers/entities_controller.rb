class EntitiesController < ApplicationController

  def index
    @entities = Entity.all.includes([:user]).where(user_id: current_user.id).order(:name)
  end

  def new
    @entity = Entity.new
  end

  def create
    @user = current_user
    @entity = @user.entities.new(entity_params)
    if @entity.save
      flash[:notice] = 'Transiction created successfully'
      @group_entity = @entity.group_entities.create(group_id: params[:group_id], entity_id: @entity.id)
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def show
    @entity = Entity.find(params[:id])
  end

  private

  def entity_params
    params.permit(:name, :amount, :group_id)
  end
end
