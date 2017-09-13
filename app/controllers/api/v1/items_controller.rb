class Api::V1::ItemsController < ApplicationController

  protect_from_forgery with: :null_session

  def create
    Item.create(name: params[:name], description: params[:description], image_url: params[:image_url])
    render json: {
      status: "created",
      body: Item.select("id, name, description, image_url").last
    }, status: 201
  end

  def show
    render json: {
      status: 200,
      body: Item.select("id, name, description, image_url").find(params[:id])
    }, status: 200
  end

  def index
    render json: {
      status: 200,
      body: Item.select("id, name, description, image_url").all
    }, status: 200
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    head 204
  end

end
