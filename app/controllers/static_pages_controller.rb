class StaticPagesController < ApplicationController
  before_action :authenticate

  def index
    @albums = RSpotify::Album.new_releases(country: @chosen_country)
    @album = @albums.first
  end

  def search
    # country_code = {
    #   "France" => 'FR',
    #   "Italy" => 'IT',
    #   "South Africa" => 'SA',
    #   "Spain" => 'SP',
    #   "United States" => 'US'
    # }

    @chosen_country = params[:search_params]
    if !@chosen_country.nil?
      redirect_to index_path
    end
  end

  private

  def search_params
    params.permit(:country)
  end

  def authenticate
    RSpotify.authenticate(ENV['SPOTIFY_USER_KEY'], ENV['SPOTIFY_USER_SECRET'])
  end
end
