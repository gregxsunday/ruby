

def tag_type(tag)
  return tag[1..tag.index(' ')]
end

def tag_attributes(tag)
  if tag.index(' ') == nil
    return ""
  end
  attrs = tag[tag.index(' ')..]
  attrs = attrs.match('.+">')[0]
  return attrs[0..-2]
end

def tag_content(tag)
  re = tag.match(">(.|\n)+</")
  return re == nil ? nil : re[0][1..-3]
end

def get_whole_tag(html, i, tag)
  tag_type = tag[1..]
  sought_start = "<#{tag_type}"
  tag_start = html[i..].index(sought_start) + i
  i = tag_start
  sought_end = "</#{tag_type}>"
  tag_end = html[tag_start..].index(sought_end) - 1 + sought_end.length + tag_start

  whole_tag = html[tag_start..tag_end]
  return whole_tag
end

def slice_comments(html)
  without_comments = html.dup
  html.scan /<!--.+-->/ do |comment|
    without_comments.slice! comment
  end
  return without_comments
end

if __FILE__ == $0
  html = ""
  File.open('html.html', 'r') do |infile|
    html = infile.read
  end
  without_comments = slice_comments(html)
  i = 0
  without_comments.scan /<[a-z]+/ do |tag|
    whole_tag = get_whole_tag(without_comments, i, tag)
    attributes = tag_attributes(whole_tag)
    content = tag_content(whole_tag)
    puts "Tag type: #{tag[1..]}\nTag attributes: #{attributes}\nTag content:\n#{content}\n\n-------------------\n\n"
  end
end