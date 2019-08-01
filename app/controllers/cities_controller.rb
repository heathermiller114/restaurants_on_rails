class CitiesController < ApplicationController
   
    def most
        @city = City.most_restaurants[0]
    end
end