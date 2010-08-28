# coding: utf-8  
class Comment < ActiveRecord::Base

  include ActsAsCommentable::Comment
	
  belongs_to :commentable, :polymorphic => true, :counter_cache => true
	validates_presence_of :comment,:title
	validates_length_of :comment, :within => 3..1000
	
  default_scope :order => 'id ASC'
	
  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user, :counter_cache => true

  before_create :check_title
  def check_title
    # check title not used in Users if commenter not logined
    if not self.user_id
      if User.find_by_name(self.title)
        self.errors.add("Name","\"#{self.title}\" 不可以使用，因为它已经被注册。")
        return false
      end
    end
  end
	
	# get top comments
	def self.snippet_recent(size = 10)
		Comment.paginate :page => 1, :per_page => size, :conditions => ["commentable_type = 'Snippet'"], :order => "id desc", :include => [:user]
	end
	
	def self.find_user_recent(user_id,size = 10)
		Comment.paginate :page => 1, :per_page => size, :conditions => ["user_id = ? and commentable_type = 'Snippet'",user_id], :order => "id desc", :include => [:user]
	end
end
