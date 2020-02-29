class StaticPagesController < ApplicationController
  before_action :authenticate

  def index
    @chosen_country = params[:search_params]
    if !@chosen_country.nil?
      @albums = RSpotify::Album.new_releases(country: @chosen_country)
      @album = @albums.first
    end

    country_hash = {
      'FR' => 'France',
      'IT' => 'Italy',
      'BR' => 'Brazil',
      'ES' => 'Spain',
      'IN' => 'India'
    }
    @written_country = country_hash[@chosen_country]
  end

  private

  def authenticate
    RSpotify.authenticate(ENV['SPOTIFY_USER_KEY'], ENV['SPOTIFY_USER_SECRET'])
  end
end
