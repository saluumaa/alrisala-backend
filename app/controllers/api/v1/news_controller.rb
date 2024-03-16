class Api::V1::NewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  load_and_authorize_resource

  # def index
  #   @news = News.includes(image_attachment: :blob).all
  #   # @news = News.all.to_json(include: [:image_url])
  #   render json: @news, methods: [:image_url]
  # end

  def index
    @news = News.all.map { |news| news.as_json.merge(image_url: news.image_url) }
    render json: @news
  end

  # def index
  #   @news = News.all
  #   render json: @news
  # end

  def show
    render json: News.find(params[:id])
  end


  def create
    @news = current_user.news.new(news_params)
  
    if @news.save
      images = params[:news][:images]
  
      if images
        images.each do |image|
          @news.images.attach(image)
        end
      end
  
      render json: { news: @news, message: 'success' }, status: :created
    else
      render json: { errors: @news.errors.full_messages }, status: :unprocessable_entity
    end
  end
  


  def update
    @news = News.find(params[:id])

    if @news.update(news_params)
      render json: @news, status: :ok
    else
      render json: { errors: @news.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @news = News.find(params[:id])
    @news.destroy
    render json: { message: 'success' }, status: :ok
  end

  private

  def news_params
    params.require(:news).permit(:title, :body, :date, images:[])
  end

end