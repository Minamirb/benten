class CommentObserver < ActiveRecord::Observer
  attr_accessor :response

  def self.instance(response)
    super().tap{|i| i.response = response }
  end

  def after_create(comment)
    response.stream.write "data: #{comment.body}\n\n"
  end
end
