class StreamsController < ApplicationController
  include ActionController::Live

  def comments
    response.headers['Content-Type']  = 'text/event-stream'
    response.headers['Cache-Control'] = 'no-cache'
    (CommentObserver.stream_pool ||= []).push response.stream
    Thread.new do
      loop { sleep 1 }
    end.join
  end
end
