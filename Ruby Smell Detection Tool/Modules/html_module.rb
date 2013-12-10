# HTML options module
module HTML_Checker
  
  def look_for_html(string)
    if /<\/?[^>]*>/.match(string)
      true
    else false
    end
  end
  
end