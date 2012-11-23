class CommentObserver < ActiveRecord::Observer
  cattr_accessor :stream_pool
  def after_create(comment)
    CommentObserver.stream_pool.each do |stream|
      begin
        stream.write "data: #{comment.body}\n\n"
      rescue IOError
      ensure
        stream.close
      end
    end
  end
end

Comment.add_observer CommentObserver.instance
