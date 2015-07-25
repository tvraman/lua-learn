-- Permutations 

-- Helper: Print a list:
function printResult (a)
   for i,v in ipairs(a) do
      io.write(v, " ")
   end
   io.write("\n")
end

-- Generate a permutation:
-- Swap  element at index i with last element and recurse.

function permgen (a, n)
   if n == 0 then
      coroutine.yield(a)
   else
      for i=1,n do
         a[n], a[i] = a[i], a[n] -- put i-th element as the last one
         permgen(a, n - 1) -- generate all permutations of the other elements
         a[n], a[i] = a[i], a[n] -- restore i-th element
      end
   end
end

-- Generator using coroutine.wrap:

function perm (a)
   local n = table.getn(a) -- length of list 
   return coroutine.wrap(function () permgen(a, n) end)
end
