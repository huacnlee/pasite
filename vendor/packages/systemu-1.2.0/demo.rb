require 'will_paginate'

class PastieController << ApplicationController
  def index
    # will_paginate custom label
    WillPaginate::ViewHelpers.pagination_options[:previous_label] = '« 上一页'
    WillPaginate::ViewHelpers.pagination_options[:next_label] = '下一页 »'
    
    # 写入将page1,page2的数据写入缓存
    Rails.cache.write('posts/page/1',@page1)
    Rails.cache.write('posts/page/2',@page2)
    Rails.cache.write('posts/index',@index)
    # 用 posts/page/* 来删除 posts/page/1,posts/page/2
    Rails.cache.delete('posts/page/*')
    # 用 posts/* 来删除 posts/index,posts/page/1,posts/page/2
    Rails.cache.delete('posts/*')
  end
  
  def show
    code = Code.find(params[:id])
    Utils.format(code)
    render "show"
  end
end

