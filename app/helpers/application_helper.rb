module ApplicationHelper
  def fast_link(text, link, html_options='')
    %(<a href="#{request.base_url}/#{link}">#{text}</a>).html_safe
  end

  def thread_link(text, link)
    fast_link(text, "forum_threads/#{link}", 'class="forum_thread_link"')
  end
end
