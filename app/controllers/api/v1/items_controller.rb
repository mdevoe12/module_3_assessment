class Api::V1::ItemsController < ApplicationController

  def show
    render json: Item.select("id, name, description, image_url").find(params[:id])
  end

  def index
    render json: Item.select("id, name, description, image_url").all
  end


end
