# encoding: utf-8
class CommentObserver < ActiveRecord::Observer 
  def after_create(comment)
    snippet = comment.commentable
    if snippet
      if snippet.user_id != comment.user_id
        Mailer.snippet_got_comment(comment,snippet)
      end
    end
  end
end
