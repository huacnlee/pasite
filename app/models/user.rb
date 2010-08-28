# coding: utf-8  
require "digest/md5"
class User < ActiveRecord::Base
  has_many :snippets	
  attr_protected :admin
	validates_presence_of :name,:login, :passwd, :email
	validates_uniqueness_of :login,:email
	validates_length_of :name, :within => 2..20
    validates_length_of :login, :within => 4..50
    validates_format_of :login, :with => /^[\w\d\-\_]+$/, :message => "格式不符合要求(字母、数字、-、_)"

	def self.encode(passwd)
    Digest::MD5.hexdigest("-D(*@#JKS@**&^@-#{passwd}")
  end

	# check login by login/email and passwd
	def self.check_login(login,passwd)
    find(:first, :conditions => ['(login = ? or email = ?) and passwd = ?',login, login, passwd])
  end

  # 更新密码
  def update_passwd(old_passwd,new_passwd,confirm_passwd)
    if old_passwd.blank?
      self.errors.add("旧密码","还未填写。")
      return false
    end

    if new_passwd.blank?
      self.errors.add("新密码","还未填写。")
      return false
    end

    if User.encode(old_passwd) != self.passwd
      self.errors.add("旧密码","不正确。")
      return false
    end

    if new_passwd != confirm_passwd
      self.errors.add("新密码与确认密码","不一至。")
      return false
    end

    self.passwd = User.encode(new_passwd)
    if self.save
      return true
    end
  end

	def self.find_top_by_snippets_count(size = 10)
		paginate :page => 1, :per_page => size, :order => "snippets_count desc"
	end
	
	
end
