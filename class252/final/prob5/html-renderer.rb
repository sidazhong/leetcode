
class HtmlRenderer
  # Add two "static" methods to this class:
  #
  # 1) The 'encode' method should escape special HTML characters.  For this example,
  # you will online need to replace '&' with '&amp;', '<' with '&lt;', and '>' with '&gt;'.
  #
  #
  # 2) The 'render' method should take a template and a variable number of arguments.
  # Apply 'encode' to each of the arguments before substituting them in a template.
  #
  # Two tips:
  #
  # First, `*args` will give you a variable number of arguments in an array called 'args'.
  # Use args.each_with_index if you want to get both the argument and the index of the argument.
  #
  # Second, you can dynamically construct a new regular expression with
  # Regexp.new, passing in a string for your regular expression.
  #
  #
  
  # https://stackoverflow.com/questions/8132492/ruby-multiple-string-replacement
  def self.encode(str)
  	map = {'<'=>'&lt;', '&'=>'&amp;', '>'=>'&gt;'}
  	re = Regexp.new(map.keys.map { |x| Regexp.escape(x) }.join('|'))
		str.gsub(re, map)
  end
  
  def self.render(str,*args)
    map = {} 
  	args.each_with_index do |v,k|
  		map['$'+(k+1).to_s]=encode(v) 
  	end
  	re = Regexp.new(map.keys.map { |x| Regexp.escape(x) }.join('|'))
		puts str.gsub(re, map)
  end
  
end

puts "<!--"
s = HtmlRenderer.encode("a < b")
puts s

s2 = "Monads & Haskell's bind operator (>>=) explained"
puts HtmlRenderer.encode(s2)

# Simple render example, used correctly
strong_template = %{
  <strong>$1</strong>
}
HtmlRenderer.render(strong_template, "Success")
puts "-->"

template = %{
  <html>
  <head>
    <title>$1</title>
  </head>
  <body>
    <h1>$1</h1>
    <p>
    Monads are one of the most confusing features to Haskell programmers.
    The explanations are often enticing and mysterious;
    You may hear them referred to as "programmable semicolons".
    </p>
    <img src='$2' />
    <img src='$3' />
    <p>
    They are an interesting design pattern.
    For a good explanation, you can read <a href='$4'>$5</a>.
    </p>
    <p>
    </p>
  </body>
  </html>
}

# If your library is working correctly, "Learn You a Haskell" should
# **not** be in italics.
HtmlRenderer.render(template,
          s2,
          'https://miro.medium.com/max/1276/0*WXYsA_WrYTAaQMRH',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQGzuWGvxSE765ShzCZGO5ek6tPot6CgT6NcRAMrmysyboBCT60',
          'http://learnyouahaskell.com/a-fistful-of-monads',
          '<em>Learn You a Haskell for Great Good!</em>')





































