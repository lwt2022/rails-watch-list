class BookmarksController < ApplicationController

  def new
    #new -> prepare empty bookmark to be filled
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
    @movies = Movie.all
  end

  def create
    # create -> populate attributes with the user input and save to DB

    # params = {"authenticity_token"=>"[FILTERED]", "bookmark"=>{"comment"=>"hello world", "movie"=>"1"}, "commit"=>"Create Bookmark", "list_id"=>"2"}

    @list = List.find(params[:list_id])
    # recreate the user input as isntances of movie and list
    @movie = Movie.find(params[:bookmark][:movie])
    @comment = params[:bookmark][:comment]
    # create a new instance of bookmark with the instances of movie list , and comment
    @bookmark = Bookmark.new(movie: @movie, list: @list, comment: @comment)
    @bookmark.save
    # .save (will generate an squl to the database)
    redirect_to "/lists/"


  end

end
