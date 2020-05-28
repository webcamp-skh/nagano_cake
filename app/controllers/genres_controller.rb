class GenresController < ApplicationController

	def show
		@genre = Genre.find(params[:id])
		@genres = Genre.where(status: true)
		@items = @genre.items.where(status: true)
	end
end
