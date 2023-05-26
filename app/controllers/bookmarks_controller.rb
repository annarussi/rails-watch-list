class BookmarksController < ApplicationController
  before_action :set_list, only: [:new, :create]

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @movie = Movie.find(params[:bookmark][:movie_id])

    @bookmark = Bookmark.new(movie: @movie, list: @list, comment: params[:bookmark][:comment] )

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end
end
