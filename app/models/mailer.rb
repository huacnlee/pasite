# coding: utf-8  
class Mailer < ActionMailer::Base
  layout "mailer"

  def regist_successed(user,passwd_unencoded)
    subject "欢迎加入 Pasite.org"
    recipients user.email
    from 'no-reply@pasite.org'
    sent_on Time.now 
    body_array = {:user => user, :passwd => passwd_unencoded}
    body body_array
    template "regist_successed"
  end

  def snippet_got_comment(comment,snippet)
    subject "Pasite.org 评论提醒"
    recipients snippet.user.email
    from 'no-reply@pasite.org'
    sent_on Time.now
    body_array = {:comment => comment, :snippet => snippet}
    body body_array
    template "snippet_got_comment"
  end

  # register successed message
  def self.regist_successed(user,passwd)
    Thread.new {
      Mailer.deliver_regist_successed(user,passwd)
    }
  end

  # snippet got comment tip
  def self.snippet_got_comment(comment,snippet)
    Thread.new {
    	Mailer.deliver_snippet_got_comment(comment,snippet)
    }
  end
end
