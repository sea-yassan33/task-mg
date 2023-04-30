class CardsController < ApplicationController
  before_action :card_list, only: %i[show edit update]

  def new
    @card = Card.new
    @list = List.find_by(id: params[:list_id])
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to :root
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @card.update(card_params)
      redirect_to :root
    else
      render 'edit'
    end
  end

  private
  def card_params
    params.require(:card).permit(:title, :memo, :list_id)
  end

  def card_list
    @card = Card.find_by(id: params[:id])
  end
end
