class FavoritesController < ApplicationController
  before_filter :authenticate_subscriber!

  def index
    if subscriber_signed_in?
      # binding.pry
      @favorites = Favorite.where(subscriber_id: current_subscriber.id)
    end
    # show all of a single subscriber's tags
  end

  def new
    @favorite = Favorite.new
    @tag = Tag.new
    # Do we use Tag.new if it's a find_or_create_by situation?
  end

  def create
    if subscriber_signed_in?
      @tag = Tag.find_or_create_by(name: (params[:favorite][:tag][:name].downcase))
      @favorite = Favorite.create(subscriber_id: current_subscriber.id, tag_id: @tag.id, score_threshold: params[:favorite][:score_threshold])
    end
    redirect_to "/favorites"
    # Subscriber
  end

  def edit
    @favorite = Favorite.find(params[:id])
    # change a subscriber's tags - threshold only
  end

  def update
    @favorite = Favorite.find(params[:id])
    @favorite.score_threshold = params[:favorite][:score_threshold]
    if @favorite.save
      redirect_to "/favorites"
    else
      @id = params[:id]
      render action: "edit_favorite"
    end
    # change a subscriber's tags - threshold only
  end

  def destroy
    Favorite.destroy(params[:id])
    redirect_to "/favorites"
    # destroy a tag - will actually only destroy subscriber.tag
  end
end
