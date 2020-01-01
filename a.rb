def bsearch_min_closed(a, c)
l, r = 0, a.size - 1
while l <= r
  m = l + (r - l) / 2
  if a[m] < c
    l = m + 1
  else
    r = m - 1
  end
end
l
end

def bsearch_min_half_open(a, c)
l, r = 0, a.size
while l < r
  m = l + (r - l) / 2
  if a[m] < c
    l = m + 1
  else
    r = m
  end
end
l
end

def bsearch_any_closed(a, c)
l, r = 0, a.size - 1
while l <= r
  m = l + (r - l) / 2
  return m if a[m] == c
  if a[m] < c
    l = m + 1
  else
    r = m - 1
  end
end
nil
end

def bsearch_any_half_open(a, c)
l, r = 0, a.size
while l < r
  m = l + (r - l) / 2
  return m if a[m] == c
  if a[m] < c
    l = m + 1
  else
    r = m
  end
end
nil
end

0.upto(8) do |nn|
[0, 1, 2].repeated_permutation(nn) do |diff|
  next if diff.last != 0
  a = []
  n = 0
  diff.each do |d|
    a << n
    n += d
  end
  p a
  -2.upto((a.max || 0) + 2) do |c|
    answer = a.find_index {|v| v >= c } || a.size
    raise if bsearch_min_closed(a, c) != answer
    raise if bsearch_min_half_open(a, c) != answer
    if a.include?(c)
      raise if a[bsearch_any_closed(a, c)] != c
      raise if a[bsearch_any_half_open(a, c)] != c
    else
      raise if bsearch_any_closed(a, c) != nil
      raise if bsearch_any_half_open(a, c) != nil
    end
  end
end
end
