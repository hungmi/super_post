class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def posts
    @posts = Post.all
  end

  def search
    if params[:q] && params[:q][:city_or_description_or_address_cont_any]
      params[:q][:city_or_description_or_address_cont_any] = params[:q][:city_or_description_or_address_cont_any].split(' ')
    end
    @q = Post.publish.available.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end

  def profile
    
  end

  def manage
    @posts = Post.all
    @post = Post.new
  end

  private
  def find_model
    @model = Pages.find(params[:id]) if params[:id]
  end
end