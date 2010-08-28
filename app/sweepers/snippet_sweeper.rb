# coding: utf-8  
class SnippetSweeper < ActionController::Caching::Sweeper
  observe Snippet

  def after_update(snippet)
    sweeper(snippet)
  end

  def sweeper(snippet)
    expire_fragment "snippets/index/*"
    expire_fragment "snippets/show/#{snippet.id}.*"
  end
end
 
