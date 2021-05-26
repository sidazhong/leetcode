class Node
  attr_accessor :key, :value

  # Every node has a key and a value.
  # The key should be a symbol, but
  # the value can be any object.
  def initialize(key, value)
    @key = key
    @value = value
    @connected = []
  end

  # Connects two nodes together
  def connect(node)
    @connected.push(node) unless connected?(node)
    node.connect(self) unless node.connected?(self)
  end

  # Returns true if there is a connection to
  # the specified node.
  def connected?(node)
    @connected.include?(node)
  end

  # Apply the block of code to every connected
  # node in the graph.  The block takes the key
  # and the value of the node.
  def each(visited=[], &block)
    #
    # ***YOUR CODE HERE***
    #
    
    block.call(@key,@value) 
    
    # avoid backtracking
    visited.push(self)
    
    # Traverse connection
    @connected.each do |node|
    	if !visited.include?(node)
    		node.each(visited, &block)
    	end
    end
  end

  # Apply the block of code to every connected
  # node in the graph, modifying the value of
  # the node accordingly.  The block takes in
  # the value of the block.
  def update_each(visited=[], &block)
    #
    # ***YOUR CODE HERE***
    #
    
    @value = block.call(@value) 
    
    # avoid backtracking
    visited.push(self)
    
    # Traverse connection
    @connected.each do |node|
    	if !visited.include?(node)
    		node.update_each(visited, &block)
    	end
    end
  end

  # Performs a depth first search of the graph,
  # looking for a node with a matching key.
  def find(key, visited=[])
    return @value if key == @key
    return nil if visited.include?(self)
    visited.push(self)
    @connected.each do |node|
      val = node.find(key, visited)
      return val if val
    end
    return nil
  end

  # Triggers a call to find, where the missing
  # method name is used as the key for the search.
  def method_missing(m, *args)
    #
    # ***YOUR CODE HERE***
    #
    find(m,[])
  end
end

a = Node.new(:Alfa, 1)
b = Node.new(:Bravo, 2)
c = Node.new(:Charlie, 3)
d = Node.new(:Delta, 4)
e = Node.new(:Echo, 5)
f = Node.new(:Foxtrot, 6)
g = Node.new(:Golf, 7)
h = Node.new(:Hotel, 8)

# Unconnected node
z = Node.new(:Zulu, 666)

a.connect(b)
a.connect(f)
b.connect(c)
b.connect(d)
d.connect(e)
e.connect(f)
e.connect(g)
e.connect(g)
g.connect(h)

puts "Initial state:"
a.each do |k,v|
  puts "#{k}: #{v}"
end

a.update_each do |v|
  v * 2
end

puts
puts "Updated state:"
a.each do |k,v|
  puts "#{k}: #{v}"
end

puts
puts "Searching:"
puts a.Alfa
puts a.Bravo
puts a.Golf
puts a.Foxtrot
puts a.Zulu



































