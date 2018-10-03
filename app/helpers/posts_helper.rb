module PostsHelper

  def get_current_page_range(array, params)
    # page_length = 20
    view_range = (0..@page_length)
    if params
      n = params.to_i
      if n-@page_length < 0
        n = @page_length
      elsif n-@page_length >= array.length
        n = array.length
      else
        view_range = (n-@page_length..n)
      end
    else
      view_range
    end
  end

end
