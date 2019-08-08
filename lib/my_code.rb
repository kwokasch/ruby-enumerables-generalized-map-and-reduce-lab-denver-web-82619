def map(source_array)
  new = []
  i = 0
  while i < source_array.length do
    new.push(yield (source_array[i]))     
      #=> will substitute block in for "yield"
    i += 1
  end
  return new
end

def reduce(source_array, starting_point = nil, &block)
  if starting_point.nil?
    source_array.reduce(&block)
    
      #=> will just execute block if no starting_point provided
  else
    source_array.reduce(starting_point, &block)
    
      #=> will execute block with starting_point value provided
  end
end

def reduce(s, sp=nil)
  if sp
    accum = sp
    i = 0
  else
    accum = s[0]
    i = 1
  end
  while i < s.length
    accum = yield(accum, s[i])
    i += 1
  end
  accum
end
