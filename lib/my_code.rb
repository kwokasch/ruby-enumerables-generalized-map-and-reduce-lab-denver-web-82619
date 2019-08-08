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

#def reduce(source_array, starting_point = nil, &block)
#  if starting_point.nil?
#    source_array.reduce(&block)
#    
#      #=> will just execute block if no starting_point provided
#  else
#    source_array.reduce(starting_point, &block)
#    
#      #=> will execute block with starting_point value provided
#  end
#end

def reduce(source_array, starting_point = nil)
  if starting_point
    
    accum = starting_point  
    
    #=> if starting_point given, set "accum" variable to that starting point and set i = 0 (this will mean that the source_array will start at index 0 following the starting_point)
    
    i = 0
  else
    accum = source_array[0]
    
     #=> if starting_point not given, set "accum" variable to the source_array at index 0 (basically, starting with the first element in the array)
     
    i = 1
  end
  while i < source_array.length
    accum = yield(accum, source_array[i])
    
     #=> set accum equal to the block (represented by yield), with the accum variable (which is either set to the starting_point or to the first element in the source_array) and the source_array at i (which is zero if starting_point given, otherwise it starts at 1)
     
    i += 1
  end
  accum   #+> return accum
end
