module PostsHelper

  def get_current_page_range(array, params)
    view_range = (0..@page_length)
    if params
      num = params.to_i
      if num-@page_length < 0
        view_range
      elsif num-@page_length >= array.length
        (array.length-@page_length..array.length)
      else
        (num-@page_length..num)
      end
    else
      view_range
    end
  end

  def get_pages(posts, range)
    @previous_page = range.min unless range.min <= 0
    @next_page = range.max + @page_length unless range.max >= posts.length
    @current_posts = posts[range]
  end

end
