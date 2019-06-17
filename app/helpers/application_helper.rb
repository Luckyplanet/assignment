module ApplicationHelper

  def pagination_config
    [1, 10, 20, 50, 100].collect{|k| [k, k]}
  end

end
