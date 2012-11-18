class CommentsController < ApplicationController
  include ActionController::Live

  def index
    response.headers['Content-Type']  = 'text/event-stream'
    response.headers['Cache-Control'] = 'no-cache'
    stream = response.stream
    fsevent = FSEvent.new

    begin
      fsevent.watch(Rails.root.join('tmp', 'comment.txt').to_s, :modify, :moved_to, :create) do |e|
        stream.write "data: #{Time.now.strftime("%F %T")}\n\n"
      end
      fsevent.run
    rescue IOError

    ensure
      stream.close
    end
  end

  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @comment }
    end
  end

  def new
    @comment = Comment.new

    respond_to do |format|
      format.html
      format.json { render json: @comment }
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render json: @comment, status: :created, location: @comment }
      else
        format.html { render action: "new" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end
end
