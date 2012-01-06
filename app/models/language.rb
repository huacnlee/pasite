# encoding: utf-8
class Language < ActiveRecord::Base
  has_many :snippets
  
  before_save :before_save
  
  def before_save
    self.snippets_count = self.snippets.count
  end

	def self.find_top(size = 10)
		paginate(:page => 1,:per_page => size,:order => "snippets_count desc")
	end
end
