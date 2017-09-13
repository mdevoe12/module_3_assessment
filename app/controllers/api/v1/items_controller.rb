class Api::V1::ItemsController < ApplicationController

  protect_from_forgery with: :null_session

  def show
    render json: Item.select("id, name, description, image_url").find(params[:id])
  end

  def index
    render json: Item.select("id, name, description, image_url").all
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    head 204
  end

end
