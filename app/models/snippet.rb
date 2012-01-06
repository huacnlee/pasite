# encoding: utf-8

class Snippet < ActiveRecord::Base
  attr_protected :views_count, :comments_count
  belongs_to :language, :counter_cache => true
  belongs_to :user, :counter_cache => true
  acts_as_taggable_on :tags

  #acts_as_views_count
  acts_as_commentable

  validates_presence_of :title,:code
  validates_length_of :title, :within => 2..200
	validates_length_of :desc, :maximum => 2000

  before_save :format_code

  define_index do
    indexes :title, :sortable => true
    indexes :desc
    indexes :code
    has language_id, created_at, updated_at
    set_property :field_weights => {
      :title => 10,
      :desc    => 6,
      :code => 3
    }
    set_property :delta => true
  end

  def skip_before_filter
    return @skip_before_filter
  end

  def skip_before_filter=(skip_before_filter)
    @skip_before_filter = skip_before_filter
  end

	# before_filters
	def format_code
    if not self.skip_before_filter
      self.size = self.code.length
      self.code_formatted = Highlight.format(self.code,self.language.slug)
      code_lines = self.code.gsub("\r\n","\n").split("\n")
      self.line_count = code_lines.length
      self.summary_formatted = Highlight.format(code_lines[0..5].join("\n"),self.language.slug)
    end
	end

	def size_kb
		f = sprintf("%0.2f",self.size / 1024)
		return "#{f} KB"
	end

	def code_formatted_show
    if code_formatted.index('<table class="highlighttable">')
      code_formatted.gsub('<div class="highlight">','<div class="inner_code">')
    end
    return code_formatted.gsub('<table class="highlighttable">',
        '<div class="highlight_top">View: <a href="#{APP_DOMAIN}/code/#{self.id}" target="_blank">Source</a> or <a href="#{APP_DOMAIN}/code/#{self.id}.raw" target="_blank">Raw</a></div><table class="highlight" cellspacing="0" cellpadding="0">').html_safe
	end

  def summary_formatted_show
    return summary_formatted.gsub('<table class="highlighttable">','<table class="highlight">').html_safe
  end

	# find method
	def self.find_page(page = 1)
		paginate :page => page, :per_page => 8,
			:order => "id desc",
			:include => [:user,:language]
	end
end
