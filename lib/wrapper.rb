class Wrapper
  def word_wrap(string, column)
    if string.length <= column
      return string
    end
    if string.include?(" ")
      space = string[0..column].rindex(" ")
      return string[0..space-1] + "\n" + word_wrap(string[space+1..-1], column) # wraps strings with spaces
    else
      return string[0..column-1] + "\n" + word_wrap(string[column..-1], column) # wraps strings without spaces
    end
  end
end
