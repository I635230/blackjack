

# array = ['heart'] * 13
# array2 = (1..13).to_a

# array.zip(array2) do |a, b|
#   print ("#{[a, b]}\n")
# end


deck = []

all_symbol_array = ['heart', 'clover', 'spade', 'diamond']
for symbol in all_symbol_array do
  ([symbol]*13).zip((1..13).to_a) do |symbol, number|
    deck.push([symbol, number])
  end
end

deck = deck.shuffle

puts deck.shift