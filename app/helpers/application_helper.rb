module ApplicationHelper
  def products_counter
    return 'empty' if session[:products].nil? || session[:products].empty?
    session[:products].count
  end

  def product_added?
    return unless product
    session[:products].keys.include? product[:id].to_s if session[:products]
  end
end
