class GenresController < ApplicationController

	def show
		@genre = Genre.find(params[:id])
		@items = @genre.items.all
	end
end
