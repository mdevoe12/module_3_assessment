class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.select("id, name, description, image_url").all
  end


end
