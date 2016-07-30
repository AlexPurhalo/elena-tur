class PagesController < ApplicationController
  def contacts
    @location = Location.all
    @hash = Gmaps4rails.build_markers(@location) do |location, marker|
      marker.lat location.latitude
      marker.lng location.longitude
      marker.infowindow location.title
      marker.picture({
                         # "url": 'http://pokefarm.wiki/images/6/61/Pok%C3%A9mon_Cosplay_Pikachu.png',
                         "width":  48,
                         "height": 48
                     })
      end
  end
end
