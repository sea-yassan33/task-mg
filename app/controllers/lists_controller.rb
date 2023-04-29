class ListsController < ApplicationController
  before_action :find_list, only: %i[edit update destroy]

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to :root
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @list.update(list_params)
      redirect_to :root
    else
      render 'edit'
    end
  end

  def destroy
    @list.destroy
    redirect_to :root
  end

  private
  def list_params
    params.require(:list).permit(:title).merge(user: current_user)
  end

  def find_list
    @list = List.find_by(id: params[:id])
  end

end
