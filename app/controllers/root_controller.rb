class RootController < ApplicationController
  def index
    @comment = Comment.new
  end
end
