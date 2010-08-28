class Language < ActiveRecord::Base
  has_many :snippets
  
  before_save :count_snippets
  def count_snippets
    self.snippets_count = self.snippets.count
  end

	def self.find_top(size = 10)
		paginate(:page => 1,:per_page => size,:order => "snippets_count desc")
	end
end
