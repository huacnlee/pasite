# version: 0.1
module ActsAsViewsCount 
    
  def self.included(base)
    base.extend ClassMethods  
  end
  
  module ClassMethods
    # == Configuration options
    # :delay 
    def acts_as_views_count(options = {})    
      cattr_accessor :views_count_delay,:views_count_delay_cache_key
      self.views_count_delay = options[:delay] || 20
      self.views_count_delay_cache_key = "models/#{self.to_s.tableize}/acts_as_views_count/"
      include ActsAsViewsCount::InstanceMethods
    end
  end

  module InstanceMethods    
    def update_views_count      
      # puts "============== #{views_count_delay_cache_key}#{self.id}"
      views_count = Rails.cache.read("#{views_count_delay_cache_key}#{self.id}")
      if !views_count
        views_count = 0
      end
      views_count += 1
      
      if views_count >= views_count_delay
  	    self.views_count = (self.views_count || 0) + views_count
  	    self.save
  	    views_count = 0	    
  	  end    	  
  	  Rails.cache.write("#{views_count_delay_cache_key}#{self.id}",views_count)
    end
    
    def views_count_s
      views_count = Rails.cache.read("#{views_count_delay_cache_key}#{self.id}") || 0
      return (self.views_count || 0) + views_count.to_i
    end
  end
end

ActiveRecord::Base.send(:include, ActsAsViewsCount)