Markabb.configure do |c|
end

Markabb.register_tag :simple_quote, Markabb::Tag.new('quote', '<blockquote>\1</blockquote>'), :quote
Markabb.register_tag :named_quote, Markabb::Tag.new(/\[quote=(.*?)\](.*?)\[\/quote\]/, '<blockquote><div class="name">\1</div>\2</blockquote>'), :quote