class Admin::GenresController < ApplicationController

  def index
    @genres = genre.all
    @genre = genre.new
  end

  def create
    @genre = genre.new(genre_params)
    @genre.save
    render :index
  end

  def edit
    @genre = genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
   if @genre.update(genre_params)
      redirect_to genres_path(@genre.id), notice: 'genre was successfully created.'
   else
      render :edit
   end 
  end
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
      
  end 

end
