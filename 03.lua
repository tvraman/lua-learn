-- Derangements 

-- Helper: Print a list:
function printResult (a)
  for i,v in ipairs(a) do io.write(v, " ") end
  io.write("\n")
end

-- Generate a Derangement:
-- Swap  element at index i with last element and recurse.
-- Dont swap if we would put i in the i-th slot.

function derangement (a, n)
  if n == 1 then
    coroutine.yield(a)
  else
    for i=1,n do
      if ((a[i] ~= n) and ( a[n] ~= i))  then 
        a[n], a[i] = a[i], a[n] -- swap i-th and n-th element
        derangement(a, n - 1) -- generate all permutations of the other elements
        a[n], a[i] = a[i], a[n] -- restore i-th element
      end
    end
  end
end

-- Generator using coroutine.wrap:
-- Usage: for i in derange(sequence) do ... end
function derange (a)
  local n = table.getn(a) -- length of list 
  return coroutine.wrap(function () derangement(a, n) end)
end
