class GenresController < ApplicationController

  before_action :authenticate_player_profile
  before_action :set_genre, only: [:show, :update, :destroy]

  # GET /genres
  def index
    if params['name'] == nil
      @genres = Genre.paginate(page: params['page'], per_page: 15)
    else
      @genres = Genre.getByNameLike(params['name'])
    end
    render json: @genres, each_serializer: GenreSerializer
  end

  # GET /genres/1
  def show
    render json: @genre, serializer: GenreSerializer
    @genre.update_attribute(:gen_views, @genre.gen_views + 1)
  end

  # POST /genres
  def create
    @genre = Genre.new(genre_params)

    if @genre.save
      render json: @genre, status: :created, location: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /genres/1
  def update
    if @genre.update(genre_params)
      render json: @genre
    else
      render json: @genre.errors, status: :unprocessable_entity
    end
  end

  # DELETE /genres/1
  def destroy
    @genre.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def genre_params
      params.fetch(:genre, {})
    end
end
