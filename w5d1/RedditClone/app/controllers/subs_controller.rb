class SubsController < ApplicationController
  before_action :require_user

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find_by_id(params[:id])
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.moderator_id = current_user.id
    if @sub.save
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def edit
    @sub = Sub.find_by_id(params[:id])
  end

  def update
    @sub = Sub.find_by_id(params[:id])
    if @sub.moderator_id != current_user.id
      flash[:errors] = ["Can only edit your own sub"]
      redirect_to subs_url
    elsif @sub.update(sub_params)
      redirect_to subs_url
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
    @sub = Sub.find_by_id(params[:id])
    if @sub.moderator_id != current_user.id
      flash[:errors] = ["Can only delete your own sub"]
      redirect_to subs_url
    else
      @sub.destroy
      redirect_to subs_url
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

end
