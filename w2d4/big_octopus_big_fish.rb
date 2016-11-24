
fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

tiles_hash = {}
tiles_array.each_with_index do |tile, i|
  tiles_hash[tile] = i
end

def sluggish_octopus(fish)
  fish.each_with_index do |f1, i|
    longest = true
    fish.each_with_index do |f2, j|
      next if i == j
      longest = false if f2.length > f1.length
   end
   return f1 if longest
  end
end

def merge_sort(arr)
  return arr if arr.length < 2
  copy = arr.dup
  m = copy.length / 2
  left = copy[0...m]
  right = copy[m..-1]
  left_sorted = merge_sort(left)
  right_sorted = merge_sort(right)
  merge(left_sorted, right_sorted)
end

def merge(arr1, arr2)
  merged = []
  i = 0
  j = 0
  while i < arr1.length && j < arr2.length
    if arr1[i].length <= arr2[j].length
      merged << arr1[i]
      i += 1
    else
      merged << arr2[j]
      j += 1
    end
    merged + arr1[i..-1] + arr2[j..-1]
  end
end

def dominant_octopus(fish)
  sorted_fish = merge_sort(fish)
  sorted_fish[-1]
end

def clever_octopus(fish)
  longest = nil
  fish.each do |f|
    longest = f if longest.nil? || f.length > longest.length
  end
  longest
end

def slow_dance(dir, tiles)
  tiles.index(dir)
end

def fast_dance(dir, tiles)
  tiles[dir]
end
